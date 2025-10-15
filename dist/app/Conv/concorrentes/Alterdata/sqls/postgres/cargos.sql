SELECT funcoesb.idfuncao,
	   funcoesb.cdchamada,
	   funcoesb.nmfuncao,
	   funcoesb.nrcbonovo,
       COALESCE((SELECT MAX(funcoesr.dtreferencia) FROM wdp.funcoesr WHERE funcoesb.idfuncao = funcoesr.idfuncao), CURRENT_DATE) AS data_inicio
FROM wdp.funcoesb
ORDER BY 1, 2