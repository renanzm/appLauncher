SELECT f.funcao, 
       f.descricao, 
       f.cbosefip as cbo, 
       f.cbo2002,
       f.codigoesocial,
       e.empresa
FROM funcoes as f,
     empresas as e
where f.idempregador = e.idempregador
  and e.exercicio = (SELECT MAX(emp2.exercicio)
	               FROM empresas AS emp2
		      WHERE emp2.empresa = e.empresa)
ORDER BY e.empresa,f.funcao