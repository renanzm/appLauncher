DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('select * from ', @retorno, '.R038HES ORDER BY NUMEMP, TIPCOL, NUMCAD, DATALT;')
exec(@query)
