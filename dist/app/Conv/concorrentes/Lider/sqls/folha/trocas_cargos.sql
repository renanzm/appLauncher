SELECT [Código da empresa], 
       [Matrícula],
       [Mês de referência],       
       [Cargo],
       [Cbo2],
	   [Mesref]
FROM (
    SELECT [Código da empresa], 
           [Matrícula],
           [Mês de referência],       
           [Cargo],
           [Cbo2],
		   [Mesref],
           ROW_NUMBER() OVER(PARTITION BY [Código da empresa], [Matrícula], [Cargo] ORDER BY [Mesref]) AS row_num
    FROM [Movimento]
) AS ranked
WHERE row_num = 1
and [Cargo] <> ''
ORDER BY [Código da empresa], [Matrícula], [Mesref];
