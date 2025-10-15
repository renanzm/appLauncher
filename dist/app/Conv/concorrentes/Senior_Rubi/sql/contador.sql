DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('
SELECT DISTINCT
       cpfcon,
       nomcon
  FROM ', @retorno, '.r350emp
 WHERE cpfcon > 0;
')
exec(@query)