SELECT pgee_sig,
       pgee_rec,
       pgee_lay
FROM pgeeso p
WHERE pgee_lay  = 1 and pgee_sit = 4
ORDER BY pgee_sig