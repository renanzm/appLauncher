SELECT '{empresa}' AS EMPRESA,
       s.CODFUN,
       min(s.ANOMES) as ANOMES,
       s.VALOR,
       s.MOTIVO,
       s.CODEVEN,
       f.TIPSAL
  FROM f{empresa}.salarios s
  LEFT JOIN f{empresa}.func f
    ON f.codfun = s.codfun
 WHERE ((s.CODEVEN = '0000' AND f.TIPSAL != 'H') OR (s.CODEVEN = '0001' AND f.TIPSAL = 'H'))
   AND s.VALOR > 0
   AND s.CODFUN <> ''
 GROUP BY EMPRESA,
          s.CODFUN,
          s.VALOR,
          s.MOTIVO,
          s.CODEVEN,
          f.tipsal
 ORDER BY CODFUN,
          ANOMES,
          VALOR