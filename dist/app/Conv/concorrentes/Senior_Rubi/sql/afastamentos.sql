DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('select afastamentos.*, situacoes.codsit, situacoes.tipsit from ', @retorno, '.R038AFA as afastamentos left join ', @retorno, '.R010SIT as situacoes
																							on situacoes.codsit = afastamentos.sitafa
where afastamentos.SITAFA in (2, 3, 4, 5, 6, 7, 11, 12, 14, 19, 22, 23, 99)
ORDER BY afastamentos.NUMEMP, afastamentos.TIPCOL, afastamentos.NUMCAD, afastamentos.DATAFA, afastamentos.HORAFA;')
exec(@query)