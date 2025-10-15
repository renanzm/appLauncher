DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT sindicatos.*, 
cidades.nomcid, 
cidades.estcid, 
bairros.nombai
FROM ', @retorno, '.R014SIN sindicatos 
LEFT JOIN ', @retorno, '.R074CID cidades ON sindicatos.codcid = cidades.codcid
LEFT JOIN ', @retorno, '.R074BAI bairros ON sindicatos.codcid = bairros.codcid AND sindicatos.codbai = bairros.codbai
ORDER BY sindicatos.CODSIN;')
exec(@query)