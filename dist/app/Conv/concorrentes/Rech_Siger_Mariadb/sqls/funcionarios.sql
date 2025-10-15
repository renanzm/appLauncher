SELECT PFUNCI.*,
       YCAPES.*,
       YCOPES_FIS.*,
       PCFUFP_IVA.*,
       YCOPES_NPA.ycop_npa,
       YCOPES_NMA.ycop_nma,
       YCOPES_TIE.ycop_tit,
       YCOPES_TIE.ycop_zon,
       YCOPES_TIE.ycop_sec,
       YCOPES_CTP.ycop_ncp,
       YCOPES_CTP.ycop_scp,
       YCOPES_CTP.ycop_ucp,
       YCOPES_CTP.ycop_ecp,
       YCOPES_CMO.ycop_nrc,
       YCOPES_CMO.ycop_ccm,
       YCOPES_CMO.ycop_ecm,
       YCOPES_CMO.ycop_vcm,
       YCOPES_CMO.ycop_ucm,
       YCOPES_RSM.ycop_ncm,
	   PCFUFP_DES.pcfu_nes,
	   PCFUFP_DES.pcfu_nve,
	   PCFUFP_DES.pcfu_are013,
	   PCFUFP_DES.pcfu_aps,
	   PCFUFP_DES.pcfu_cfs013,
	   PCFUFP_DES.pcfu_csu013,
	   PCFUFP_DES.pcfu_cgi,
	   PCFUFP_DES.pcfu_cga
FROM PFUNCI
LEFT JOIN PCFUFP_IVA
ON PFUNCI.pfun_emp = PCFUFP_IVA.pcfu_emp
AND PFUNCI.pfun_cfi = PCFUFP_IVA.pcfu_cfi011 
AND PFUNCI.pfun_cod = PCFUFP_IVA.pcfu_cod011 
LEFT JOIN PCFUFP_DES
ON PFUNCI.pfun_emp = PCFUFP_DES.pcfu_emp
AND PFUNCI.pfun_cfi = PCFUFP_DES.pcfu_cfi013
AND PFUNCI.pfun_cod = PCFUFP_DES.pcfu_cod013 
LEFT JOIN YCAPES
ON PFUNCI.pfun_idp = YCAPES.ycap_idp
LEFT JOIN YCOPES_FIS
ON YCAPES.ycap_idp = YCOPES_FIS.ycop_idp005 
LEFT JOIN YCOPES_NPA
ON YCAPES.ycap_idp = YCOPES_NPA.ycop_idp013
LEFT JOIN YCOPES_NMA
ON YCAPES.ycap_idp = YCOPES_NMA.ycop_idp012
LEFT JOIN YCOPES_TIE
ON YCAPES.ycap_idp = YCOPES_TIE.ycop_idp010
LEFT JOIN YCOPES_CTP
ON YCAPES.ycap_idp = YCOPES_CTP.ycop_idp008
LEFT JOIN YCOPES_CMO
ON YCAPES.ycap_idp = YCOPES_CMO.ycop_idp007
LEFT JOIN YCOPES_RSM
ON YCAPES.ycap_idp = YCOPES_RSM.ycop_idp011
ORDER BY pfun_emp, pfun_cod