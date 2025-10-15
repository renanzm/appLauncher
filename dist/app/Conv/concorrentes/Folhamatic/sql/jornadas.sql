SELECT '{empresa}' AS EMPRESA,
	   codigo AS i_jornada,
	   descricao AS nome,
	   inicio AS data_inicio,
	   tipo AS tipo,
	   inativo AS situacao
FROM f{empresa}.hores
ORDER BY 2