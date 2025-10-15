SELECT h.CD_EMPRESA,
       h.CD_EMPREGADO,
       h.DT_ALTERACAO,
       h.CD_HORARIO
  FROM HISTORICOHORARIO h
 WHERE h.DT_ALTERACAO != (SELECT MIN(hist.DT_ALTERACAO)
                            FROM HISTORICOHORARIO hist
                           WHERE hist.CD_EMPRESA = h.CD_EMPRESA
                             AND hist.CD_EMPREGADO = h.CD_EMPREGADO)
 ORDER BY h.CD_EMPRESA,
          h.CD_EMPREGADO,
          h.DT_ALTERACAO;