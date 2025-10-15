SELECT DISTINCT f.EMPRESA,
                ts.TURNO_DIA,
                (SELECT td.ENTRADA
                   FROM TURNO_DIA td
                  WHERE td.TURNO_DIA = ts.TURNO_DIA) AS ENTRADA,
                (SELECT td.INI_INT
                   FROM TURNO_DIA td
                  WHERE td.TURNO_DIA = ts.TURNO_DIA) AS SAIDA_INTERVALO,
                (SELECT td.FIM_INT
                   FROM TURNO_DIA td
                  WHERE td.TURNO_DIA = ts.TURNO_DIA) AS ENTRADA_INTERVALO,
                (SELECT td.SAIDA
                   FROM TURNO_DIA td
                  WHERE td.TURNO_DIA = ts.TURNO_DIA) AS SAIDA
           FROM FUNCIONARIO f
          RIGHT JOIN TURNO_SEMANA ts
             ON f.TURNO_SEMANA = ts.TURNO_SEMANA
          WHERE f.EMPRESA IS NOT NULL
            AND ts.TURNO_DIA IS NOT NULL
          ORDER BY f.EMPRESA,
                   ts.TURNO_DIA;