DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('select distinct R038HCA.NUMEMP, R024CAR.* from ', @retorno, '.R024CAR
inner join ', @retorno, '.R038HCA on R038HCA.ESTCAR = R024CAR.ESTCAR and R038HCA.CODCAR = R024CAR.CODCAR 
ORDER BY R038HCA.NUMEMP, R024CAR.ESTCAR, R024CAR.CODCAR')
exec(@query)