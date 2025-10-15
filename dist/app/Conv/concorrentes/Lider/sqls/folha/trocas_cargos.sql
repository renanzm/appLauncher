SELECT [C�digo da empresa], 
       [Matr�cula],
       [M�s de refer�ncia],       
       [Cargo],
       [Cbo2],
	   [Mesref]
FROM (
    SELECT [C�digo da empresa], 
           [Matr�cula],
           [M�s de refer�ncia],       
           [Cargo],
           [Cbo2],
		   [Mesref],
           ROW_NUMBER() OVER(PARTITION BY [C�digo da empresa], [Matr�cula], [Cargo] ORDER BY [Mesref]) AS row_num
    FROM [Movimento]
) AS ranked
WHERE row_num = 1
and [Cargo] <> ''
ORDER BY [C�digo da empresa], [Matr�cula], [Mesref];
