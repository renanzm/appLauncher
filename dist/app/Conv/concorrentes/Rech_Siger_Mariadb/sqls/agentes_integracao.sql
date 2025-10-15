SELECT ycap_nom,
       ycap_dtn,
       ycap_cgc,
       ycap_log,
       ycap_num,
       ycap_com,
       ycap_bai,
       ycap_cep,
	   ycap_mun,
	   ycap_est,
	   ycap_fon
FROM ycapes
INNER JOIN PCFUFP_DES
ON ycapes.ycap_cgc = PCFUFP_DES.pcfu_cga  
WHERE ycap_tin = 'J'
GROUP BY ycap_cgc
ORDER BY ycap_cgc 