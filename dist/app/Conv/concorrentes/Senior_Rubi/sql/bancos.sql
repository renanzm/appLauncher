DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT 
    R012AGE.codban,
    R012AGE.codage,
    R012BAN.nomban,
    R012AGE.nomage,
    R012AGE.codpai,
    R012AGE.codest,
    R012AGE.codcid,
	cidades.nomcid,
    R012AGE.digage 
FROM ', @retorno, '.R012AGE
LEFT OUTER JOIN ', @retorno, '.R012BAN ON R012BAN.codban = R012AGE.codban
LEFT OUTER JOIN ', @retorno, '.R074CID cidades ON R012AGE.codcid = cidades.codcid
ORDER BY R012AGE.CODBAN, R012AGE.CODAGE;')
exec(@query)