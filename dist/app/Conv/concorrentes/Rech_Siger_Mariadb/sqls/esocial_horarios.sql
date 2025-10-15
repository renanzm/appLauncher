SELECT pgee_sig,
       PCGESO_HOR.pcge_jor008 as codigo,
       pgee_rec,
       pgee_lay
FROM pgeeso
INNER JOIN PCGESO_HOR
ON pgeeso.pgee_ide = PCGESO_HOR.pcge_ide008
WHERE pgee_lay  = 8 AND pgee_sit = 4
ORDER BY 1, 2, 3