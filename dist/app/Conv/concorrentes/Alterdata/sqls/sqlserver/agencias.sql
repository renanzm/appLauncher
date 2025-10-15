SELECT agencia.idbanco,
	   agencia.idagencia,
	   agencia.nmcidade,
	   agencia.cduf,
	   agencia.nmcidade,
	   agencia.nmagencia,
	   agencia.cdchamada AS agencia,
       bancos.cdchamada AS numero,
	   bancos.nmbanco
FROM wdp.agencia
LEFT JOIN wdp.bancos
	ON agencia.idbanco = bancos.idbanco
ORDER BY 1, 2