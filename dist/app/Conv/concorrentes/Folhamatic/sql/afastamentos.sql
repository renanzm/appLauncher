SELECT '{empresa}' AS EMPRESA,
	   codfun,
	   'H' AS tipo,
	   TO_CHAR(date(dtres), 'DD/MM/YYYY') AS data_inicio,
	   '' AS data_fim,
	   '0' AS qtddias
FROM f{empresa}.func func
WHERE func.dtres IS NOT NULL

UNION

SELECT '{empresa}' AS EMPRESA,
	   codfun,
	   codmovto AS motivo,
	   TO_CHAR(date(datamovto), 'DD/MM/YYYY') AS data_inicio,
	   TO_CHAR(date((SELECT datamovto
					FROM f{empresa}.afastamentos subtable
					WHERE subtable.codfun = afastamentos.codfun AND
						  subtable.codmovto LIKE 'Z%' AND
						  subtable.datamovto > afastamentos.datamovto
				    ORDER BY 1
					LIMIT 1)), 'DD/MM/YYYY') AS data_fim,
		qtddias
FROM f{empresa}.afastamentos afastamentos
WHERE codmovto NOT IN ('Z1', 'Z2', 'Z3', 'Z4', 'Z5', 'Z6', 'H', 'I', 'I1', 'I2', 'I3', 'I4', 'I5', 'J', 'K', 'L', 'N1', 'N2', 'N3', '') AND
	  fk_ferias = ''
ORDER BY 2, 4