SELECT codigoempresa, 
	   codsetor,
	   descricao
FROM dpcuca.tbtpsetor
WHERE obrapropria = 1
ORDER BY codigoempresa, codsetor