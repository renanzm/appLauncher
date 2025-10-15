SELECT [Código da empresa], 
       [Matrícula],
       [Mês de referência],       
       [Salário],
       CONVERT(DATETIME, ISNULL(NULLIF(RIGHT([Mês de referência], 4), '') + NULLIF(LEFT([Mês de referência], 2), '') + '01', '19000101')) AS DataFormatada
  FROM [Movimento]
 WHERE ISDATE(ISNULL(NULLIF(RIGHT([Mês de referência], 4), '') + NULLIF(LEFT([Mês de referência], 2), '') + '01', '19000101')) = 1
 ORDER BY 1, 2, DataFormatada