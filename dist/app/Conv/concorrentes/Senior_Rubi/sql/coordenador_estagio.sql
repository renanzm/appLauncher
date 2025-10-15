WITH table_max as (
  SELECT numemp,
         tipcol,
         numcad,
         max(seqsvi) as seqsvi
    FROM r350svi
   WHERE nivest > 0
   GROUP BY numemp,
            tipcol,
            numcad
)
SELECT r350svi.cpfsup,
       r350svi.nomsup
  FROM r350svi
 INNER JOIN table_max
    ON r350svi.numemp = table_max.numemp
   AND r350svi.tipcol = table_max.tipcol
   AND r350svi.numcad = table_max.numcad
   AND r350svi.seqsvi = table_max.seqsvi;