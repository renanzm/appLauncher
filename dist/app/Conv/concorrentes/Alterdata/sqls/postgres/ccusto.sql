SELECT ccusto.*,
       depto.iddepartamento,
	   depto.idempresa
FROM wcont.ccusto
INNER JOIN wdp.depto
	ON COALESCE(depto.cdcentrodecusto::TEXT, '') = COALESCE(ccusto.cdchamada::TEXT, '')