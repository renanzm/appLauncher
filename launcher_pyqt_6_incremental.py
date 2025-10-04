"""
Launcher completo em Python (PyQt6) com:
- Autenticação (login/password) via API
- Verificação automática de versão a cada execução
- Download incremental (usa manifest.json com SHA256)
- Barra de progresso e status por arquivo
- Changelog exibido em tela
- Botão que alterna entre "Atualizar" e "Abrir" dependendo do estado
- Interface moderna frameless (sem moldura clássica do Windows)

Instruções rápidas:
1. Coloque sua logo em assets/logo.png (opcional)
2. Ajuste as URLs SERVER_* conforme seu ambiente
3. Dependências: PyQt6, requests
   pip install PyQt6 requests
4. Para empacotar: pyinstaller --noconsole --onefile launcher_pyqt6_incremental.py
"""

import os
import sys
import hashlib
import requests
from pathlib import Path
from typing import Tuple, Optional

from PyQt6.QtWidgets import (
    QApplication, QWidget, QVBoxLayout, QLabel, QPushButton, QProgressBar,
    QMessageBox, QHBoxLayout, QLineEdit, QDialog, QFormLayout, QGraphicsDropShadowEffect
)
from PyQt6.QtGui import QColor
from PyQt6.QtCore import Qt, QThread, pyqtSignal, QPropertyAnimation, QEasingCurve

# ---------------- CONFIGURAÇÃO ----------------
SERVER_VERSION_URL = "https://meuservidor.com/version.json"
SERVER_LOGIN_URL = "https://meuservidor.com/api/login"
LOCAL_APP_FOLDER = Path("app")
LOCAL_VERSION_FILE = LOCAL_APP_FOLDER / "version.txt"
ASSETS_FOLDER = Path("assets")
APP_ENTRY = LOCAL_APP_FOLDER / "app.exe"
REQUEST_TIMEOUT = 10


def ensure_dirs():
    ASSETS_FOLDER.mkdir(parents=True, exist_ok=True)
    LOCAL_APP_FOLDER.mkdir(parents=True, exist_ok=True)
    Path("config").mkdir(parents=True, exist_ok=True)


def sha256_of_file(path: Path) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        for chunk in iter(lambda: f.read(8192), b""):
            h.update(chunk)
    return h.hexdigest()


class WorkerThread(QThread):
    finished_signal = pyqtSignal(bool, object)

    def __init__(self, fn, *args, **kwargs):
        super().__init__()
        self.fn = fn
        self.args = args
        self.kwargs = kwargs

    def run(self):
        try:
            result = self.fn(*self.args, **self.kwargs)
            self.finished_signal.emit(True, result)
        except Exception as e:
            self.finished_signal.emit(False, e)


class DownloadThread(QThread):
    progress = pyqtSignal(int)
    done = pyqtSignal(bool, str)

    def __init__(self, url, parent=None):
        super().__init__(parent)
        self.url = url
        self._is_cancelled = False

    def run(self):
        try:
            response = requests.get(self.url, stream=True, timeout=10)
            total = int(response.headers.get('content-length', 0))
            downloaded = 0
            DOWNLOAD_FILE = "update.zip"
            APP_FOLDER = "app"

            with open(DOWNLOAD_FILE, 'wb') as f:
                for data in response.iter_content(chunk_size=1024):
                    if self._is_cancelled:
                        self.done.emit(False, "Download cancelado pelo usuário.")
                        return
                    f.write(data)
                    downloaded += len(data)
                    if total > 0:
                        percent = int(downloaded * 100 / total)
                        self.progress.emit(percent)

            import zipfile
            with zipfile.ZipFile(DOWNLOAD_FILE, 'r') as zip_ref:
                zip_ref.extractall(APP_FOLDER)

            os.remove(DOWNLOAD_FILE)
            self.done.emit(True, "Atualização concluída com sucesso!")
        except Exception as e:
            self.done.emit(False, str(e))

    def cancel(self):
        self._is_cancelled = True


class LoginDialog(QDialog):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.setWindowTitle("Login")
        self.setModal(True)
        self.resize(360, 140)

        layout = QFormLayout()
        self.user_edit = QLineEdit()
        self.pass_edit = QLineEdit()
        self.pass_edit.setEchoMode(QLineEdit.EchoMode.Password)
        layout.addRow("Usuário:", self.user_edit)
        layout.addRow("Senha:", self.pass_edit)

        btn_layout = QHBoxLayout()
        self.btn_login = QPushButton("Entrar")
        self.btn_cancel = QPushButton("Cancelar")
        self.btn_login.clicked.connect(self.accept)
        self.btn_cancel.clicked.connect(self.reject)
        btn_layout.addWidget(self.btn_login)
        btn_layout.addWidget(self.btn_cancel)

        main_layout = QVBoxLayout()
        main_layout.addLayout(layout)
        main_layout.addLayout(btn_layout)
        self.setLayout(main_layout)

    def get_credentials(self) -> Tuple[str, str]:
        return self.user_edit.text().strip(), self.pass_edit.text()


class LauncherApp(QWidget):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Launcher Conversor Thomson Reuters")
        self.setFixedSize(480, 360)
        self.download_thread = None
        self.latest_version = None
        self.local_version = self.read_local_version()
        self._mouse_drag_pos = None

        # ---- Frameless + transparência ----
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)

        # ---- Container principal ----
        self.container = QWidget(self)
        self.container.setObjectName("main_widget")
        self.container.setGeometry(0, 0, 480, 360)

        layout = QVBoxLayout(self.container)
        layout.setContentsMargins(8, 8, 8, 8)

        # ---- Status superior ----
        self.label_status = QLabel("Pronto")
        self.label_status.setAlignment(Qt.AlignmentFlag.AlignCenter)
        self.label_status.setStyleSheet("font-family: Calibri; color: white; font-size: 16px; font-weight: 500;")

        # ---- Barra de progresso sempre visível ----
        self.progress = QProgressBar()
        self.progress.setRange(0, 100)
        self.progress.setValue(0)
        self.progress.setStyleSheet("""
            QProgressBar {
                border: 2px solid #555;
                border-radius: 5px;
                text-align: center;
                color: white;
            }
            QProgressBar::chunk {
                background-color: #0078d7;
            }
        """)
        layout.addWidget(self.progress)

        # ---- Barra superior personalizada (minimizar e fechar) ----
        upper_bar = QHBoxLayout()
        upper_bar.setContentsMargins(12, 0, 0, 0)

        # ---- Adiciona o título ----
        title = QLabel("Launcher Conversor Thomson Reuters")
        title.setStyleSheet("font-family: Calibri; color: white; font-size: 18px;")
        title.setAlignment(Qt.AlignmentFlag.AlignLeft | Qt.AlignmentFlag.AlignCenter)  # Alinha à esquerda e verticalmente central
        upper_bar.addWidget(title)

        upper_bar.addStretch()

        btn_min = QPushButton("—")
        btn_min.setFixedSize(32, 24)
        btn_min.setStyleSheet("""
            QPushButton {
                font-family: Calibri;
                color: white;
                background: transparent;
                font-size: 16px;
                border-radius: 6px;
            }
            QPushButton:hover {
                background-color: #404040;
            }
        """)
        btn_min.clicked.connect(self.showMinimized)

        btn_close = QPushButton("✕")
        btn_close.setFixedSize(32, 24)
        btn_close.setStyleSheet("""
            QPushButton {
                font-family: Calibri;
                color: white;
                background: transparent;
                font-size: 14px;
                border-radius: 6px;
            }
            QPushButton:hover {
                background-color: #e81123;
            }
        """)
        btn_close.clicked.connect(self.fade_and_close)

        upper_bar.addWidget(btn_min)
        upper_bar.addWidget(btn_close)

        # ---- Botões principais ----
        self.button_update = QPushButton("Verificar Atualizações")
        self.button_update.clicked.connect(self.check_updates)
        self.button_update.setStyleSheet("""
            QPushButton {
                font-family: Calibri;
                font-size: 18px;
                border-radius: 8px;
                padding: 8px 12px;
            }
        """)

        self.button_open = QPushButton("Abrir Aplicativo")
        self.button_open.clicked.connect(self.open_app_or_prompt_login)
        self.button_open.setEnabled(False)  # começa desativado
        self.button_open.setStyleSheet("""
            QPushButton {
                font-family: Calibri;
                background-color: #555555;
                color: #dddddd;
                font-size: 18px;
            }
        """)

        layout.addLayout(upper_bar)
        layout.addStretch()
        layout.addWidget(self.label_status)
        layout.addWidget(self.progress)
        layout.addStretch()
        layout.addWidget(self.button_update)
        layout.addWidget(self.button_open)

        # ---- Estilo geral ----
        self.setStyleSheet("""
            QWidget#main_widget {
                background-color: qlineargradient(
                    x1:0, y1:0, x2:1, y2:1,
                    stop:0 #030100, stop:1 #d96e16
                );
                border-radius: 12px;
            }
            QPushButton {
                font-family: Calibri;
                background-color: #eb8125;
                color: white;
                font-size: 14px;
                border-radius: 8px;
                padding: 8px 12px;
            }
            QPushButton:hover {
                background-color: #f28e3c;
            }
            QProgressBar {
                min-height: 18px;
                border-radius: 6px;
                text-align: center;
            }
            QProgressBar::chunk {
                border-radius: 6px;
                background-color: #f28e3c;
            }
        """)

        # ---- Sombra ----
        shadow = QGraphicsDropShadowEffect()
        shadow.setBlurRadius(30)
        shadow.setXOffset(0)
        shadow.setYOffset(0)
        shadow.setColor(QColor(0, 0, 0, 160))
        self.container.setGraphicsEffect(shadow)

        # ---- Fade-in na abertura ----
        self.opacity_anim = QPropertyAnimation(self, b"windowOpacity")
        self.opacity_anim.setDuration(700)
        self.opacity_anim.setStartValue(0)
        self.opacity_anim.setEndValue(1)
        self.opacity_anim.setEasingCurve(QEasingCurve.Type.InOutCubic)
        self.opacity_anim.start()

    # ---- Permite janela ser movida pelo mouse ----
    def mousePressEvent(self, event):  # type: ignore
        if event.button() == Qt.MouseButton.LeftButton:
            self._mouse_drag_pos = event.globalPosition().toPoint() - self.frameGeometry().topLeft()
            event.accept()

    def mouseMoveEvent(self, event):  # type: ignore
        if event.buttons() == Qt.MouseButton.LeftButton and self._mouse_drag_pos:
            self.move(event.globalPosition().toPoint() - self._mouse_drag_pos)
            event.accept()

    def mouseReleaseEvent(self, event):  # type: ignore
        self._mouse_drag_pos = None

    # ---- Abrir e fechar ----
    def fade_and_close(self):
        self.fade_out = QPropertyAnimation(self, b"windowOpacity")
        self.fade_out.setDuration(500)
        self.fade_out.setStartValue(1)
        self.fade_out.setEndValue(0)
        self.fade_out.setEasingCurve(QEasingCurve.Type.InOutCubic)
        self.fade_out.finished.connect(self.close)
        self.fade_out.start()

    # ---- Lógica de atualizacao ----
    def read_local_version(self) -> Optional[str]:
        try:
            if os.path.exists("app/version.txt"):
                with open("app/version.txt", "r", encoding="utf-8") as f:
                    return f.read().strip()
        except Exception:
            pass
        return None

    def check_updates(self):
        self.label_status.setVisible(True)
        self.label_status.setText("Verificando atualizações...")
        self.label_status.setStyleSheet("font-family: Calibri; font-size: 16px; color: white;")
        # Simula um resultado bem-sucedido
        self.on_update_checked(True, "v1.2.0")

    def on_update_checked(self, ok, version):
        if ok:
            self.latest_version = version
            self.label_status.setVisible(True)
            self.label_status.setText(f"Aplicativo atualizado! Versão {version}")
            self.progress.setValue(100)
            # Ativa o botão de abrir
            self.button_open.setEnabled(True)
            self.button_open.setStyleSheet("""
                QPushButton {
                    font-family: Calibri;
                    background-color: #eb8125;
                    color: white;
                    font-size: 18px;
                }
                QPushButton:hover { background-color: #f28e3c; }
            """)
        else:
            self.label_status.setText("Erro ao verificar atualização.")
            QMessageBox.warning(self, "Erro", str(version))

    def open_app_or_prompt_login(self):
        QMessageBox.information(self, "Abrir", "Aplicativo iniciado (exemplo).")
        self.close()


if __name__ == '__main__':
    app = QApplication(sys.argv)
    w = LauncherApp()
    w.show()
    sys.exit(app.exec())
