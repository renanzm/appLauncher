SELECT empresas.id_empresa,
	   sat.data_alteracao,
	   empresas.codpagtogps,
	   empresas.aliqinnsentidade,
	   terceiros.inss_empresa,
	   tbterc.id_tbfpas,
	   tbterc.codterceiros,
	   sat.aliquota_rat
FROM dpcuca.empresas
LEFT JOIN dpcuca.sat
ON empresas.id_empresa = sat.codigoempresa
LEFT JOIN dpcuca.terceiros
ON empresas.id_empresa = terceiros.codigo_empresa
AND sat.data_alteracao = terceiros.data_alteracao
LEFT JOIN dpcuca.tbterc
ON terceiros.id_tbterc = tbterc.id_tbterc

UNION

SELECT empresas.id_empresa,
	   terceiros.data_alteracao,
	   empresas.codpagtogps,
	   empresas.aliqinnsentidade,
	   terceiros.inss_empresa,
	   tbterc.id_tbfpas,
	   tbterc.codterceiros,
	   sat.aliquota_rat
FROM dpcuca.empresas
LEFT JOIN dpcuca.terceiros
ON empresas.id_empresa = terceiros.codigo_empresa
LEFT JOIN dpcuca.sat
ON empresas.id_empresa = sat.codigoempresa
AND sat.data_alteracao = terceiros.data_alteracao
LEFT JOIN dpcuca.tbterc
ON terceiros.id_tbterc = tbterc.id_tbterc
ORDER BY 1, 2