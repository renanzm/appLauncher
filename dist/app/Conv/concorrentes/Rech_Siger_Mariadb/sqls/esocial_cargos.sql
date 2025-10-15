SELECT pgee_sig,
       PCGESO_CAR.pcge_car005 as codigo,
       pgee_rec,
       pgee_lay
FROM pgeeso
INNER JOIN PCGESO_CAR
ON pgeeso.pgee_ide = PCGESO_CAR.pcge_ide005
WHERE pgee_lay  = 5 AND pgee_sit = 4
ORDER BY 1, 2, 3