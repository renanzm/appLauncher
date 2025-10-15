SELECT ferias.*,
	   DATEADD (year, 2, DtPeriodoAquisInicial) AS limite_gozo,
      (SELECT MAX(dtpagamento) FROM wdp.r{codi_emp} AS t1 WHERE t1.idfuncionario = ferias.IdFuncionario and t1.dtinicial = ferias.dtinicial and t1.tpprocesso = 'F') AS dtpagamento,
	  (SELECT MIN(dtabono) FROM wdp.r{codi_emp} AS t1 WHERE t1.idfuncionario = ferias.IdFuncionario and t1.dtinicial = ferias.dtinicial and t1.tpprocesso = 'F') AS dtabono
FROM wdp.a{codi_emp} AS ferias
WHERE dtperiodoaquisinicial IS NOT NULL
ORDER BY 1, 6, 4