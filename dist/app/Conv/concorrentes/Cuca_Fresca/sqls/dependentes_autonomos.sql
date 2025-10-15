SELECT autonomo.codigoempresa,
	   dependaut.*
FROM dpcuca.dependaut
INNER JOIN dpcuca.autonomo
ON dependaut.id_tbauton = autonomo.id_tbauton
ORDER BY 1, 3