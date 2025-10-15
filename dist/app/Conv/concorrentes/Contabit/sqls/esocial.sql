SELECT idempresa,
		idtabelaorigem,
		dttabelaorigem,
		dtfimtabelaorigem,
		dstabelaorigem,
		cdregistroesocial,
		flnovavalidade,
		flstatus,
		nrreciboentrega
FROM dbo.tblogdadoesocial
WHERE cdregistroesocial in (1000, 1005, 1020, 2200, 2205, 2206, 2220, 2230, 2300, 2306)
      AND floperacao not in ('E')
ORDER BY 1, 3