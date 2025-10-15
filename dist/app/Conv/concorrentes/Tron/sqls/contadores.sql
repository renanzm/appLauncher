SELECT tblect.*,
        (SELECT MAX(cid.NOMCID)
		   FROM TBLCID as cid
		  WHERE cid.codcid = tblect.codcid ) as cidade,
        (SELECT MAX(cid.CODUNDFED)
		   FROM TBLCID as cid
		  WHERE cid.codcid = tblect.codcid ) as estado
  FROM tblect
 ORDER BY 1