SELECT afast.*,
	   emp.tpsexo
FROM wdp.a{codi_emp} AS afast
INNER JOIN wdp.f{codi_emp} as emp
ON afast.idfuncionario = emp.idfuncionario
ORDER BY 1, 2