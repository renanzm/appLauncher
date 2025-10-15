SELECT empcont.idempresa,
	   contas.*
FROM wcont.contas
INNER JOIN wcont.empcont 
	ON contas.idplanodecontas = empcont.idplanodecontas
ORDER BY 1, 2