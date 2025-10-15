SELECT f.r0010tributacao
FROM DATABASE.spedecf AS f
WHERE f.anoecf = (SELECT MAX(sub.anoecf) FROM DATABASE.spedecf AS sub)