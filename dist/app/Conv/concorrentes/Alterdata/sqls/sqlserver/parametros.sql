SELECT DISTINCT e.idempresa,
       e.inicio_vigencia_esocial,
       ef.grupo,
       e.stregimeprocfolha
FROM wdp.empdp e
LEFT JOIN wdp.esocial_faseamento ef
	ON ef.inicio_obrigatoriedade = e.inicio_vigencia_esocial
ORDER BY 1