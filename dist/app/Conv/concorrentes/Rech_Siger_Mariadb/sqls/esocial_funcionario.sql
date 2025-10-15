SELECT pgee_sig,
       PCGESO_ADM.pcge_cfi025 as filial,
       PCGESO_ADM.pcge_cod025 as codigo,
       pgee_rec,
       pgee_lay
FROM pgeeso
INNER JOIN PCGESO_ADM
ON pgeeso.pgee_ide = PCGESO_ADM.pcge_ide025
WHERE pgee_lay  = 25 and pgee_sit = 4

UNION ALL

SELECT pgee_sig,
       PCGESO_ISV.pcge_cfi036,
       PCGESO_ISV.pcge_cod036,
       pgee_rec,
       pgee_lay
FROM pgeeso
INNER JOIN PCGESO_ISV
ON pgeeso.pgee_ide = PCGESO_ISV.pcge_ide036
WHERE pgee_lay  = 36 and pgee_sit = 4
ORDER BY 1, 2, 3

