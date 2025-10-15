DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT 
dependentes.*,
cidades.nomcid AS nomcid_nasc,
cidades.estcid AS estcid_nasc
FROM ', @retorno, '.R036DEP dependentes
LEFT JOIN ', @retorno, '.R074CID AS cidades 
    ON dependentes.locnas = cidades.codcid
ORDER BY dependentes.NUMEMP, dependentes.TIPCOL, dependentes.NUMCAD, dependentes.CODDEP;')
exec(@query)