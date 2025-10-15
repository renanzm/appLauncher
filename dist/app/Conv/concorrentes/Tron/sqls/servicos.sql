SELECT tbltomempser.*, tbltom.*, tblpes.*,
       fpa.codfpa, fpa.aliinsfolpagfpa, fpa.aliinsautfpa, fpa.aliinsprolabfpa,
       fpater.codterfpaoutent, 
       ( SELECT SUM( fpater2.alqterfpaoutent )
           FROM TBLFPAOUTENT as fpater2
          WHERE fpater2.codfpa = fpater.codfpa
            AND fpater2.codclafpa = fpater.codclafpa
            AND fpater2.codterfpaoutent = fpater.codterfpaoutent ) AS alqterfpaoutent  
  FROM TBLTOMEMPSER as tbltomempser
       INNER JOIN TBLTOM AS tbltom
            ON    tbltom.tiptom = tbltomempser.tiptom
              AND tbltom.codpestom = tbltomempser.codpestom
       INNER JOIN TBLPES AS tblpes
            ON    tblpes.tippes = tbltomempser.tiptom
              AND tblpes.codpes = tbltomempser.codpestom
       LEFT OUTER JOIN TBLTEROUTENTTOM AS tertom
                 ON    tertom.tiptom = tbltomempser.tiptom
                   AND tertom.codpestom = tbltomempser.codpestom
       LEFT OUTER JOIN TBLFPA as fpa
                 ON    fpa.codfpa = tertom.codfpa
                   AND fpa.codclafpa = tertom.codclafpa
       LEFT OUTER JOIN TBLFPAOUTENT as fpater
                 ON    fpater.codfpa = tertom.codfpa
                   AND fpater.codclafpa = tertom.codclafpa
                   AND fpater.codoutent = tertom.codoutent
                   AND fpater.codterfpaoutent = tertom.codterfpaoutent
 WHERE ( tertom.codoutent = ( SELECT MAX( tertom2.codoutent )
                                FROM TBLTEROUTENTTOM AS tertom2
                               WHERE tertom2.tiptom = tbltomempser.tiptom
                                 AND tertom2.codpestom = tbltomempser.codpestom )
         OR tertom.codoutent IS NULL )
ORDER BY 1, 2