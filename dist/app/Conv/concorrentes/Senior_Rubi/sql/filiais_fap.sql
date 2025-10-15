DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('
SELECT r350est.numemp,
       r350est.codfil,
       CAST(r350est.inival AS DATE) AS inival,
       r350est.fatfap
  FROM ', @retorno, '.r350est
 ORDER BY 1, 2, seqest DESC;
')
exec(@query)
