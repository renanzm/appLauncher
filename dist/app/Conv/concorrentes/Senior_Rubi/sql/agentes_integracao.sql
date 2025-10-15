DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('
WITH table_max as (
  SELECT numemp,
         tipcol,
         numcad,
         max(seqsvi) as seqsvi
    FROM ', @retorno, '.r350svi
   WHERE nivest > 0
   GROUP BY numemp,
            tipcol,
            numcad
)
SELECT r350svi.empage,
       r350svi.nomage,
       r350svi.endage,
       r350svi.numage,
       r350svi.baiage,
       r350svi.cepage,
       r350svi.estage
  FROM ', @retorno, '.r350svi
 INNER JOIN table_max
    ON r350svi.numemp = table_max.numemp
   AND r350svi.tipcol = table_max.tipcol
   AND r350svi.numcad = table_max.numcad
   AND r350svi.seqsvi = table_max.seqsvi;
')
exec(@query)
