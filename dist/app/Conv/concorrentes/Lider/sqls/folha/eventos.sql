SELECT [Código da empresa],
       [Código da verba],
	   [Tipo de verba],
	   [Descrição da verba]
FROM Verbas
WHERE [Código da verba] in ('004', '005', '006', '009', '010', '011', '012', '014') and [Código da empresa] <> ''

UNION 

SELECT [Código da empresa],
       [Código da verba],
	   [Tipo de verba],
	   [Descrição da verba]
FROM Verbas
WHERE Média = 1 and [Código da empresa] <> ''

ORDER BY [Código da empresa], [Código da verba]