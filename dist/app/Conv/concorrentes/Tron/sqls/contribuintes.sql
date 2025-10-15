SELECT TBLCBTIND.*, TBLPES.*,
       (SELECT MAX(tel.numtel)
          FROM TBLTEL as tel
         WHERE tel.codpes = TBLPES.codpes
           AND tel.tippes = TBLPES.tippes) as telefone_pessoa,
       (SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codpes = TBLPES.codpes
                                AND tel.tippes = TBLPES.tippes) ) as ddd_pessoa,
        (SELECT MAX(cid.NOMCID)
		   FROM TBLCID as cid
		  WHERE cid.codcid = tblpes.codcid ) as cidade,
        (SELECT MAX(cid.CODUNDFED)
		   FROM TBLCID as cid
		  WHERE cid.codcid = tblpes.codcid ) as estado,
        (SELECT MAX(cid.NOMCID)
		   FROM TBLCID as cid
		  WHERE cid.codcid = tblpes.NATPES ) as cidade_nasc,
        (SELECT MAX(cid.CODUNDFED)
		   FROM TBLCID as cid
		  WHERE cid.codcid = tblpes.NATPES ) as estado_nasc	 
  FROM TBLCBTIND, TBLPES
 WHERE TBLCBTIND.CODPESCBTIND = TBLPES.CODPES
   AND TBLCBTIND.TIPPESCBTIND = TBLPES.TIPPES
ORDER BY TBLCBTIND.CODEMPFOL, TBLCBTIND.CODPESCBTIND