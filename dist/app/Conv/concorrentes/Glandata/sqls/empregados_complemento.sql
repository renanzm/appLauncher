SELECT empresa,
	funcionario,
	deficiente,
	tipodeficiencia,
	estadocivil,
	tipologradouro,
	logradouro,
	numero,
    complemento,
	bairro,
	(SELECT municipios.nome
	 FROM municipios
	 WHERE municipios.municipio = funcionarioscompetencias.municipio) AS cidade,
	(SELECT municipios.estado
	 FROM municipios
	 WHERE municipios.municipio = funcionarioscompetencias.municipio) AS estado,
	cep,
	dddtelefone,
	telefone,
    email,
	funcao,
	(SELECT max(funcoes.descricao)
	 FROM funcoes
	 WHERE funcoes.funcao = funcionarioscompetencias.funcao) AS nome_funcao,
	 
	(SELECT max(funcoes.cbosefip)
	 FROM funcoes
	 WHERE funcoes.funcao = funcionarioscompetencias.funcao) AS cbo,
	 
	 (SELECT max(funcoes.cbo2002)
	 FROM funcoes
	 WHERE funcoes.funcao = funcionarioscompetencias.funcao) AS cbo2002,
	departamento,
	setor,
	secao,
	sindicato,
	ocorrenciafgts,
    categoria,
	centrocusto,
	(SELECT fimaquisitivo
		FROM ferias
		WHERE ferias.empresa = funcionarioscompetencias.empresa and 
			  ferias.funcionario = funcionarioscompetencias.funcionario and
			  ferias.numeroferias = (SELECT MAX(ferias2.numeroferias)
									FROM ferias AS ferias2
									WHERE ferias2.empresa = ferias.empresa and
										  ferias2.funcionario = ferias.funcionario)) as venc_ferias,
	categoriaesocial,
	(select matriculaesocial from funcionarios where funcionarios.empresa = funcionarioscompetencias.empresa 
			and funcionarios.funcionario = funcionarioscompetencias.funcionario) as matriculaesocial
  
  FROM funcionarioscompetencias
  WHERE to_number(funcionarioscompetencias.competeinverte,'000000') = (SELECT MAX(to_number(func2.competeinverte,'000000'))
									FROM funcionarioscompetencias AS func2
									WHERE func2.empresa = funcionarioscompetencias.empresa AND
									      func2.funcionario = funcionarioscompetencias.funcionario)
  ORDER BY empresa, funcionario