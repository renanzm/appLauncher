SELECT empcont.idempresa, 
	   pcont.*
FROM wcont.pcont
INNER JOIN wcont.empcont 
	ON pcont.idplanodecontas = empcont.idplanodecontas
ORDER BY 1, 2