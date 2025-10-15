DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
SET @query = concat('select R004HOR.codhor,
                            R004HOR.deshor,
                            (select dateadd(mi,horbat, convert(time,''00:00:00'')) from ', @retorno,'.R004MHR where R004MHR.codhor = R004HOR.codhor and R004MHR.seqmar = 1) as entrada,
                            (select dateadd(mi,horbat, convert(time,''00:00:00'')) from ', @retorno,'.R004MHR where R004MHR.codhor = R004HOR.codhor and R004MHR.seqmar = 2) as saida_intervalo,
                            (select dateadd(mi,horbat, convert(time,''00:00:00'')) from ', @retorno,'.R004MHR where R004MHR.codhor = R004HOR.codhor and R004MHR.seqmar = 3) as entrada_intervalo,
                            (select dateadd(mi,horbat, convert(time,''00:00:00'')) from ', @retorno,'.R004MHR where R004MHR.codhor = R004HOR.codhor and R004MHR.seqmar = 4) as saida
                       from ', @retorno,'.R004HOR
                      ORDER BY 1,2')
exec(@query)