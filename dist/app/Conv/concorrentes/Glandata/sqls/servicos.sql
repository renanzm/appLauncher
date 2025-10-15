SELECT empresa,
	   departamento,
	   nome,
	   responsavel,
	   tipologradouro,
	   logradouro,
       numero,
	   complemento,
	   bairro,
	   (SELECT municipios.nome
		FROM municipios
		WHERE municipios.municipio = departamentos.municipio) AS cidade,
	   (SELECT municipios.estado
		FROM municipios
		WHERE municipios.municipio = departamentos.municipio) AS estado,
	   cep,
	   cnpj,
	   cei,
       tomador,
	   obra,
	   obraadm,
	   codigogps,
	   centrocusto
FROM departamentos
ORDER BY empresa, departamento
