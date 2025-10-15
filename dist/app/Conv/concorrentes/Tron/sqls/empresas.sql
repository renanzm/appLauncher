SELECT DISTINCT TBLEMP.*,
	   emp_detalhe.*,
	   empfol.codempfol,
	   empfol.codfpa,
	   empfol.codrecsfp,
	   empfol.codgps,
	   empfol.alqacitrbempfol,
	   fpater.codterfpaoutent, 
       ( SELECT SUM( fpater2.alqterfpaoutent )
           FROM TBLFPAOUTENT as fpater2
          WHERE fpater2.codfpa = fpater.codfpa
            AND fpater2.codclafpa = fpater.codclafpa
            AND fpater2.codterfpaoutent = fpater.codterfpaoutent ) AS alqterfpaoutent,
       (SELECT 1 
		FROM TBLEMPCTB as emp_contabilidade 
		WHERE emp_contabilidade.CODEMPCTB = emp_detalhe.codemp) as ucta_emp,
	   (SELECT 1 
	    FROM TBLEMPESC as emp_escrita
		WHERE emp_escrita.CODEMPESC = emp_detalhe.codemp) as uefi_emp,
       (SELECT MAX(tel.numtel) 
	    FROM TBLTEL as tel
		WHERE tel.codemp = emp_detalhe.codemp) as telefone_emp,
	   (SELECT MAX(cid.dddcid)
        FROM TBLCID as cid
		WHERE cid.codcid = (SELECT MAX(tel.codcid)
                            FROM TBLTEL as tel
                            WHERE tel.codemp = emp_detalhe.codemp) ) as ddd_emp,
       (SELECT TBLFPA.aliinsfolpagfpa
           FROM TBLFPA
          WHERE TBLFPA.CODFPA = empfol.CODFPA
            AND TBLFPA.CODCLAFPA = empfol.CODCLAFPA),
       (SELECT TBLFPA.aliinsautfpa
           FROM TBLFPA
          WHERE TBLFPA.CODFPA = empfol.CODFPA
            AND TBLFPA.CODCLAFPA = empfol.CODCLAFPA),
       (SELECT TBLFPA.aliinsprolabfpa
           FROM TBLFPA
          WHERE TBLFPA.CODFPA = empfol.CODFPA
            AND TBLFPA.CODCLAFPA = empfol.CODCLAFPA),
        (SELECT MAX(cid.NOMCID)
		   FROM TBLCID as cid
		  WHERE cid.codcid = TBLEMP.codcid ) as cidade_emp,
        (SELECT MAX(cid.CODUNDFED)
		   FROM TBLCID as cid
		  WHERE cid.codcid = TBLEMP.codcid ) as estado_emp,
		  SOCIOS.NOMSCORSP AS rleg_emp,
		  SOCIOS.INSSCORSP AS cpf_leg_emp,
		  SOCIOS.LGRSCORSP AS end_leg_emp,
		(SELECT MAX(cid.NOMCID)
		   FROM TBLCID as cid
		  WHERE cid.codcid = SOCIOS.codcid ) as mun_leg_emp,
		  SOCIOS.CEPSCORSP AS cep_leg_emp,
		  SOCIOS.NUMSCORSP AS nume_leg_emp,
		  SOCIOS.BAISCORSP AS bair_leg_emp,
		  SOCIOS.TELSCORSP AS fone_leg_emp,
		  (SELECT TBLCRG.DSCCRG
          FROM TBLCRG
         WHERE SOCIOS.CODCRG = TBLCRG.CODCRG) AS DESCCAR,
		(SELECT MAX(cid.CODUNDFED)
		   FROM TBLCID as cid
		  WHERE cid.codcid = SOCIOS.codcid ) as UF_LEG_EMP,
		  SOCIOS.EMASCORSP
FROM TBLEMP 
LEFT JOIN TBLEMPDET as emp_detalhe
ON  TBLEMP.CODEMP = emp_detalhe.CODEMP
LEFT JOIN TBLEMPFOL AS empfol
ON  TBLEMP.CODEMP = empfol.codempfol
LEFT JOIN TBLTEROUTENTEMPFOL AS teremp
ON  teremp.codempfol = empfol.codempfol
LEFT OUTER JOIN TBLFPAOUTENT as fpater
ON fpater.codfpa = teremp.codfpa
AND fpater.codclafpa = teremp.codclafpa
AND fpater.codoutent = teremp.codoutent
AND fpater.codterfpaoutent = teremp.codterfpaoutent
LEFT JOIN TBLSCORSPEMP AS TABRESP 
ON TABRESP.CODEMP = TBLEMP.CODEMP
AND TABRESP.CODSCORSP = (SELECT SUB.CODSCORSP 
						   FROM TBLSCORSPEMP AS SUB
						 WHERE TABRESP.CODEMP = SUB.CODEMP
							AND SUB.ASSSCORSPEMP = 'S'
							AND SUB.TIPSCORSP <> 'S'
							ORDER BY 1 ASC
							ROWS 1)
LEFT JOIN TBLSCORSP AS SOCIOS 
ON SOCIOS.codscorsp = TABRESP.CODSCORSP
   WHERE (teremp.codoutent = (SELECT MAX( teremp2.codoutent )
           FROM TBLTEROUTENTEMPFOL AS teremp2
           WHERE teremp2.codempfol = empfol.codempfol)
OR teremp.codoutent IS NULL)
and ( exists (SELECT 1 FROM TBLEMPESC WHERE TBLEMPESC.CODEMPESC = TBLEMP.CODEMP) 
   or exists (SELECT 1 FROM TBLEMPCTB WHERE TBLEMPCTB.CODEMPCTB = TBLEMP.CODEMP)
   or exists (SELECT 1 FROM TBLEMPFOL WHERE TBLEMPFOL.CODEMPFOL = TBLEMP.CODEMP) )
ORDER BY 1