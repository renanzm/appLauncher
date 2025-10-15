SELECT tblcttparsal.CODEMPFOL, 
	   tblcttparsal.MATEPGCTT,
	   tblcttparsal.DTACTTPARSAL,
	   tblcttparsal.DTAREACTTPARSAL,
	   COALESCE(tblcttparsal.REFPARSAL,tblcttparsal.VLRREACTTPARSAL) AS SALARIO,
       (SELECT MAX( tblano.dscano) FROM tblano as tblano WHERE tblano.codano = tblcttparsal.codano AND tblano.tipano = tblcttparsal.tipano) as motivo
FROM TBLCTTPARSAL AS tblcttparsal
WHERE (tblcttparsal.REFPARSAL IS NOT NULL OR tblcttparsal.VLRREACTTPARSAL IS NOT NULL)
AND CODPARSAL NOT IN (5)
UNION ALL
SELECT tblcttparsal.CODEMPFOL, 
	   tblcttparsal.MATEPGCTT,
	   tblcttparsal.DTACTTPARSAL,
	   tblcttparsal.DTAREACTTPARSAL,
	   tblcttparsal.REFPARSAL * (SELECT TBLSALMIN.VLRSALMIN 
	   							   FROM TBLSALMIN
	   							 WHERE DTAINISALMIN <= tblcttparsal.DTACTTPARSAL
	   							 ORDER BY DTAINISALMIN DESC
									ROWS 1) AS SALARIO,
       (SELECT MAX( tblano.dscano) FROM tblano as tblano WHERE tblano.codano = tblcttparsal.codano AND tblano.tipano = tblcttparsal.tipano) as motivo
FROM TBLCTTPARSAL AS tblcttparsal
WHERE (tblcttparsal.REFPARSAL IS NOT NULL OR tblcttparsal.VLRREACTTPARSAL IS NOT NULL)
AND CODPARSAL IN (5)
ORDER BY 1, 2, 3
