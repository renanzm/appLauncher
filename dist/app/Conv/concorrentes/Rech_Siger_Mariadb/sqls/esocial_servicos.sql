SELECT pgee_sig,
       PCGESO_EST.pcge_cfi002 as filial,
       PCGESO_EST.pcge_dep002 as servico,
       pgee_rec,
       pgee_lay
FROM pgeeso
INNER JOIN PCGESO_EST
ON pgeeso.pgee_ide = PCGESO_EST.pcge_ide002 
WHERE pgee_lay  = 2  AND pgee_sit = 4

UNION ALL 

SELECT pgee_sig,
       PCGESO_LOT.pcge_cfi004 as filial,
       PCGESO_LOT.pcge_dep004 as servico,
       pgee_rec,
       pgee_lay
FROM pgeeso
INNER JOIN PCGESO_LOT
ON pgeeso.pgee_ide = PCGESO_LOT.pcge_ide004
WHERE pgee_lay  = 4 AND pgee_sit = 4
ORDER BY 1, 2, 3