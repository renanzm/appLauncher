DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('select * from ', @retorno, '.R038HSA AS t1 WHERE seqalt = (select max(t2.seqalt) from ', @retorno, '.R038HSA AS t2 where t2.numemp = t1.numemp and t2.numcad = t1.numcad and t2.datalt = t1.datalt) ORDER BY NUMEMP, TIPCOL, NUMCAD, DATALT, SEQALT;')
exec(@query)