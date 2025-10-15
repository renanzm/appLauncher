SELECT hist.idfuncionario,
	   hist.dtmudanca,
	   COALESCE(hist.idfuncaoant, (SELECT cargo.idfuncao FROM wdp.funcoesb AS cargo WHERE hist.cdchamadaant = cargo.cdchamada)) AS idfuncaoant,
	   COALESCE(hist.idfuncaoatual, (SELECT cargo.idfuncao FROM wdp.funcoesb AS cargo WHERE hist.cdchamada = cargo.cdchamada)) AS idfuncaoatual
FROM wdp.fh{codi_emp} AS hist
ORDER BY 1, 2