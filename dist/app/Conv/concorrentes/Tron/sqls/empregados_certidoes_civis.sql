SELECT ctt.codempfol,
	   ctt.matepgctt,
	   pes.nomfun,
	   ctt.dtaadmtractt,
	   pes.codcid,
	   epg.dtanscpes,
       epg.tipcerciv,
	   epg.dtaemicerciv,
	   epg.termatcerciv,
	   epg.livcerciv,
	   epg.folcerciv,
	   epg.carcerciv,
	   epg.muccerciv,
	   epg.ufcerciv
FROM tblctt as ctt,
	 tblpes as pes,
     tblepg as epg
WHERE ctt.codpesepg = pes.codpes
	AND ctt.codpesepg = epg.codpesepg
	AND ctt.tippesepg = pes.tippes
	AND epg.tipcerciv IS NOT NULL
ORDER BY 1, 2
