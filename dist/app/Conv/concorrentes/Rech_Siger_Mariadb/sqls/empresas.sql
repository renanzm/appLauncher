SELECT YEMPRE.*,
       PEMPRE.*,
       (SELECT MIN(pfun_adm) FROM PFUNCI WHERE PFUNCI.pfun_emp = YEMPRE.yemp_sig) AS old_admissao,
       PEMPRE.pemp_cfp AS FPAS
FROM YEMPRE
INNER JOIN PEMPRE
ON YEMPRE.yemp_sig = PEMPRE.pemp_sig
AND YEMPRE.yemp_cfi = PEMPRE.pemp_cfi
WHERE YEMPRE.yemp_cfi = 0