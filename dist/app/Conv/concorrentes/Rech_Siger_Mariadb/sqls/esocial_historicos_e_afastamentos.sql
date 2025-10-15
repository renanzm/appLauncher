SELECT pgee_sig,
       PCGESO_ACT.pcge_cfi027 AS filial,
       PCGESO_ACT.pcge_cod027 AS codigo,
       pgee_rec,
       pgee_lay,
       pgee_dmi AS data_ref
FROM pgeeso
INNER JOIN PCGESO_ACT
ON pgeeso.pgee_ide = PCGESO_ACT.pcge_ide027
WHERE pgee_lay = 27 AND pgee_sit = 4 AND pgee_dmi IS NOT NULL

UNION ALL

SELECT pgee_sig,
       PCGESO_AFA.pcge_cfi030 AS filial,
       PCGESO_AFA.pcge_cod030 AS codigo,
       pgee_rec,
       pgee_lay,
       PCGESO_AFA.pcge_dti030 AS data_ref
FROM pgeeso
INNER JOIN PCGESO_AFA
ON pgeeso.pgee_ide = PCGESO_AFA.pcge_ide030
WHERE pgee_lay = 30 AND pgee_sit = 4 AND PCGESO_AFA.pcge_dti030 IS NOT NULL

UNION ALL

SELECT pgee_sig,
       PCGESO_ASV.pcge_cfi037 AS filial,
       PCGESO_ASV.pcge_cod037 AS codigo,
       pgee_rec,
       pgee_lay,
       pgee_dal AS data_ref
FROM pgeeso
INNER JOIN PCGESO_ASV
ON pgeeso.pgee_ide = PCGESO_ASV.pcge_ide037
WHERE pgee_lay = 37 AND pgee_sit = 4 AND pgee_dal IS NOT NULL
order by 1, 2, 3

