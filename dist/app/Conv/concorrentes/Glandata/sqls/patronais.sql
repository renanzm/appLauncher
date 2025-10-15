SELECT exercicio,
	   sindicatopatronal, 
	   nome, 
	   cnpj, 
	   tipologradouro, 
	   logradouro, 
       numero, 
	   complemento, 
	   bairro, 
	   (SELECT municipios.nome
		FROM municipios
		WHERE municipios.municipio = sindicatospatronal.municipio) AS cidade,
	   (SELECT municipios.estado
	    FROM municipios
		WHERE municipios.municipio = sindicatospatronal.municipio) AS estado, 
	   cep, 
	   dddtelefone, 
       telefone, 
	   entidade, 
	   limitepagamento, 
	   contato, 
	   telefone2, 
	   email, 
       homepage
FROM sindicatospatronal
WHERE sindicatospatronal.exercicio = (SELECT MAX(sind2.exercicio)
									  FROM sindicatospatronal AS sind2
									  WHERE sind2.sindicatopatronal = sindicatospatronal.sindicatopatronal)
ORDER BY sindicatopatronal
