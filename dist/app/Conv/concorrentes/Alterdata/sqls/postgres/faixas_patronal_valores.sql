WITH faixas_por_ano AS (
	SELECT cdtabela,
		   EXTRACT(YEAR FROM dtreferencia) AS ano,
		   max(dtreferencia) as referencia
	FROM wdp.sindpat
	GROUP BY 1, 2
	ORDER BY 1, 2
)
SELECT sindpat.cdtabela,
       faixas_por_ano.ano,
	   sindpat.vlfaixainicial,
	   sindpat.vlfaixafinal,
	   sindpat.alpercentual,
	   sindpat.vladicional
FROM wdp.sindpat
INNER JOIN faixas_por_ano
ON faixas_por_ano.cdtabela = sindpat.cdtabela
AND faixas_por_ano.referencia = sindpat.dtreferencia
ORDER BY 1, 2, 3