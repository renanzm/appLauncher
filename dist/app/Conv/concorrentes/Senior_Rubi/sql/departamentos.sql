DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('select distinct R038HLO.NUMEMP, R016ORN.* from ', @retorno, '.R016ORN 
inner join ', @retorno, '.R038HLO on R038HLO.TABORG = R016ORN.TABORG and R038HLO.NUMLOC = R016ORN.NUMLOC
ORDER BY R038HLO.NUMEMP, R016ORN.TABORG, R016ORN.NUMLOC;')
exec(@query)