DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT
    R030GRP.numemp,
    R030GRP.codfil,
    R030GRP.tipgrp,
    r030grp.datgrp,
    R030GRP.codfpa,
    R030GRP.acitra,
    R030GRP.persat,
    R030GRP.perise,
    R030GRP.codter,
    dados_servicos.cdrfgt,
    dados_servicos.banfgt,
    dados_servicos.agefgt,
    dados_servicos.empfgt,
    op_fgt.optsim,
    empresa.nomfil,
	empresa.tipfil,
    empresa.ncaepf,
    empresa.inscei,
    empresa.numcgc,
    empresa.tiplot,
    empresa.atiirf,
    empresa.dddtel,
    empresa.numtel,
    empresa.endfil,
    empresa.cplfil,
    empresa.endnum,
    empresa.codcep,
    empresa.codcid,	
    cidades.nomcid,
    cidades.estcid,
    empresa.codbai,
    bairros.nombai
FROM ', @retorno, '.R030GRP
LEFT OUTER JOIN ', @retorno, '.R030FFG dados_servicos ON dados_servicos.numemp = R030GRP.numemp AND dados_servicos.codfil = R030GRP.codfil
LEFT OUTER JOIN ', @retorno, '.R030FGT op_fgt ON op_fgt.numemp = R030GRP.numemp
LEFT OUTER JOIN ', @retorno, '.R030FIL empresa ON R030GRP.numemp = empresa.numemp AND R030GRP.codfil = empresa.codfil
LEFT OUTER JOIN ', @retorno, '.R074CID cidades ON empresa.codcid = cidades.codcid
LEFT OUTER JOIN ', @retorno, '.R074BAI bairros ON empresa.codcid = bairros.codcid AND empresa.codbai = bairros.codbai
ORDER BY 1,2,3,4')
exec(@query)