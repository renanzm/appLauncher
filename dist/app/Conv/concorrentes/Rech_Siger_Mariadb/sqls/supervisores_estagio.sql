SELECT PCFUFP_DES.pcfu_emp,
	   PCFUFP_DES.pcfu_cfs013,
	   PCFUFP_DES.pcfu_csu013,
       PFUNCI.pfun_nom,
       PFUNCI.pfun_adm,
       PFUNCI.pfun_cpf,
       YCOPES_FIS.ycop_gri,
       YCAPES.ycap_ema
FROM PFUNCI
INNER JOIN PCFUFP_DES
ON PCFUFP_DES.pcfu_emp = PFUNCI.pfun_emp
AND PCFUFP_DES.pcfu_cfs013 = PFUNCI.pfun_cfi
AND PCFUFP_DES.pcfu_csu013 = PFUNCI.pfun_cod
LEFT JOIN YCOPES_FIS
ON PFUNCI.pfun_idp = YCOPES_FIS.ycop_idp005 
LEFT JOIN YCAPES
ON PFUNCI.pfun_idp = YCAPES.ycap_idp