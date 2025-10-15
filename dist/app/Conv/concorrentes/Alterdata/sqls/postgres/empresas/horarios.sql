SELECT DISTINCT jor.*
FROM wdp.f{codi_emp} AS func 
INNER JOIN wdp.horario AS jor
ON func.idhorario = jor.idhorario
ORDER BY 1, 2