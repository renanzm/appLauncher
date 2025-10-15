DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT * FROM ', @retorno, '.R018CCU ORDER BY NUMEMP, CODCCU;')
exec(@query)
