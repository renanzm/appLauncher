SELECT [C�digo da empresa],
       [C�digo da verba],
	   [Tipo de verba],
	   [Descri��o da verba]
FROM Verbas
WHERE [C�digo da verba] in ('004', '005', '006', '009', '010', '011', '012', '014') and [C�digo da empresa] <> ''

UNION 

SELECT [C�digo da empresa],
       [C�digo da verba],
	   [Tipo de verba],
	   [Descri��o da verba]
FROM Verbas
WHERE M�dia = 1 and [C�digo da empresa] <> ''

ORDER BY [C�digo da empresa], [C�digo da verba]