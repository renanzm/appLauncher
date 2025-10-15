SELECT [C�digo da empresa], 
       [Matr�cula],
       [M�s de refer�ncia],       
       [Sal�rio],
       CONVERT(DATETIME, ISNULL(NULLIF(RIGHT([M�s de refer�ncia], 4), '') + NULLIF(LEFT([M�s de refer�ncia], 2), '') + '01', '19000101')) AS DataFormatada
  FROM [Movimento]
 WHERE ISDATE(ISNULL(NULLIF(RIGHT([M�s de refer�ncia], 4), '') + NULLIF(LEFT([M�s de refer�ncia], 2), '') + '01', '19000101')) = 1
 ORDER BY 1, 2, DataFormatada