SELECT ccusto.*,
       depto.iddepartamento,
	   depto.idempresa
FROM wcont.ccusto
INNER JOIN wdp.depto
	ON dbo.getNumericValue(depto.cdcentrodecusto) = dbo.getNumericValue(ccusto.cdchamada)