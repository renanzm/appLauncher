SELECT codigoempresa,
       codigoempregado as codigosocio,
	   dataafastamento,
	   dataalta,
	   fgtsafastamento
FROM dpcuca.afastsoc
ORDER BY 1, 2, 3