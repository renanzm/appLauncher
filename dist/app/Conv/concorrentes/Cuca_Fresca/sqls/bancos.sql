SELECT id_tbbanco, 
       banco,
	   agencia,
	   codagencia,
	   codmunicipioibge,
	   cod_compensacao, 
       vs_leiaute,
	   vs_lote_febraban
FROM dpcuca.tbbanco
ORDER BY id_tbbanco
