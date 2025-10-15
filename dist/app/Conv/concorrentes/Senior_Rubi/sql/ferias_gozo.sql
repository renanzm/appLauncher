DECLARE @data_referencia DATETIME = '1900-01-01';
DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('
SELECT *,
    DATEADD(day, diafer, inifer - 1) AS finfer,
    DATEDIFF(DAY, ''1900-01-01'' , inifer) AS gozo_inicio_dn,
    DATEDIFF(DAY, ''1900-01-01'' , inifer + diafer) AS gozo_fim_dn
FROM ', @retorno, '.R040FEM ferias_gozo
ORDER BY NUMEMP, TIPCOL, NUMCAD, INIFER;')
exec(@query)
