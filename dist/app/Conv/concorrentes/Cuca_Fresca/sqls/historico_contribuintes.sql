SELECT codigo_empresa AS codigoempresa,
       codigo_socio,
	   data_inicio,
	   (SELECT codsetor FROM dpcuca.tbtpsetor WHERE tbtpsetor.id = soclocal.id_tbtpsetor) AS codsetor
FROM dpcuca.soclocal
ORDER BY 1, 2, 3