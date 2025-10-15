SELECT empresa, funcionario, dependente, nomedependente, datanascimento, 
       dataentregacertidao, tipoparentesco, relacaodependencia, (SELECT municipios.nome
																 FROM municipios
																 WHERE municipios.municipio = dependentes.naturalmunicipio) as cidade,
       cartorio, registro, livro, folha, dependenteir, dependentesalfam, 
	   dependentecreche, sexo, rg, orgaoemissorrg, cpf 
FROM dependentes
ORDER BY empresa, funcionario, dependente