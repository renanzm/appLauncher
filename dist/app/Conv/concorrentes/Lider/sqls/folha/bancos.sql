SELECT DISTINCT [Cc banco],
	   [Cc banco nome],
	   [Cc agência]
FROM Funcionários
WHERE [Cc banco] <> '' AND [Cc agência] <> ''