SELECT DISTINCT f.EMPRESA,
                f.TURNO_SEMANA,
                ts.DIA,
                ts.TURNO_DIA,
                ts.HORARIO,
                ts.ORDEM
           FROM FUNCIONARIO f
          RIGHT JOIN TURNO_SEMANA ts
             ON f.TURNO_SEMANA = ts.TURNO_SEMANA
          WHERE f.EMPRESA IS NOT NULL
          ORDER BY f.EMPRESA,
                   f.TURNO_SEMANA,
                   ts.ORDEM;