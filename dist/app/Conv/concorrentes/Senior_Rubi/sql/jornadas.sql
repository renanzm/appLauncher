DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('select distinct r034fun.numemp, r006esc.* from ', @retorno,'.R034FUN 
 inner join ', @retorno,'.R006ESC on R006ESC.codesc = r034fun.codesc
 ORDER BY 1,2')
exec(@query)