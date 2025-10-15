SELECT sindicato, 
	nome, 
	tipologradouro, 
	logradouro, 
	numero, 
	complemento, 
	bairro, 
	(SELECT municipios.nome
	 FROM municipios
	 WHERE municipios.municipio = sindicatos.municipio) AS cidade, 
	(SELECT municipios.estado
	 FROM municipios
	 WHERE municipios.municipio = sindicatos.municipio) AS estado, 
	 cep, 
         dddtelefone, 
	 telefone, 
	 cnpj, 
	 entidade, 
	 mesdissidio, 
	 percentualnoturno
	 
FROM sindicatos
WHERE sindicatos.competeinverte = (SELECT MAX(sind2.competeinverte)
					 FROM sindicatos AS sind2
				         WHERE sind2.sindicato = sindicatos.sindicato)
ORDER BY sindicato