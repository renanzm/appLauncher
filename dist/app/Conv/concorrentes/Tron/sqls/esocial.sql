SELECT eso.codemp,
       eso.regmsgcomeso,
	   eso.prorspmsgcomeso,
	   eso.rspmsgcomeso,
	   eso.numrcbeso,	   
	   eso.matepgctt,
	   eso.codpescbtind,
       eso.tippescbtind,
	   eso.seqmovmen,
	   eso.codsitepg,
	   eso.codtipfol,
	   eso.mesanofatgermovmen,
	   eso.evegereso,
       ( SELECT MAX( s1005.codpestom )
           FROM tbllogs1005 AS s1005
          WHERE s1005.codempfol = eso.codemp
            AND s1005.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1005' ) ) AS i_servicos_1005,
       ( SELECT MAX( s1020.codlot )
           FROM tbllogs1020 AS s1020
          WHERE s1020.codempfol = eso.codemp
            AND s1020.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1020' ) ) AS i_servicos_1020,
       ( SELECT MAX( s1030.codocupro )
           FROM tbllogs1030 AS s1030
          WHERE s1030.codempfol = eso.codemp
            AND s1030.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1030' ) ) AS i_cargos,
       ( SELECT MAX( s1050.codhortrb )
           FROM tbllogs1050 AS s1050
          WHERE s1050.codmsgcomeso = eso.codmsgcomeso
            AND eso.regmsgcomeso IN ( 'S-1050' ) ) AS i_horario,
       eso.xmlmsgcomeso
	   
  FROM TBLMSGCOMESO AS eso
  
 WHERE eso.regmsgcomeso IN ('S-1000','S-1005','S-1020','S-1030','S-1050','S-2200','S-2205','S-2206','S-2300', 'S-2230')
   AND eso.tipamb = 1
   AND eso.RSPMSGCOMESO LIKE '201%'
    OR eso.RSPMSGCOMESO LIKE '202%'
   AND eso.regmsgcomeso IN ('S-1000','S-1005','S-1020','S-1030','S-1050','S-2200','S-2205','S-2206','S-2300', 'S-2230')
   AND eso.tipamb = 1
ORDER BY eso.CODEMP, eso.REGMSGCOMESO