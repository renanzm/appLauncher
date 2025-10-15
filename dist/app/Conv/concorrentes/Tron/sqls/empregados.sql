SELECT TBLCTT.*,tblepg.*,tblpes.*,
       (SELECT MAX(ctt_cargo.CODOCUPRO)
	      FROM TBLCTTOCUPRO as ctt_cargo
		 WHERE ctt_cargo.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_cargo.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_cargo.DTACTTOCUPRO = TBLCTT.DTAADMTRACTT) as i_cargos,
		(SELECT MAX(ctt_depto.CODDEP)
	      FROM TBLCTTDEP as ctt_depto
		 WHERE ctt_depto.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_depto.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_depto.DTACTTDEP = TBLCTT.DTAADMTRACTT) as i_depto,
		(SELECT MAX(ctt_sec.CODSEC)
	      FROM TBLCTTSEC as ctt_sec
		 WHERE ctt_sec.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_sec.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_sec.DTACTTSEC = TBLCTT.DTAADMTRACTT) as i_ccustos,
		(SELECT MAX(ctt_hor.CODHORTRB)
	      FROM TBLHORTRBCTT as ctt_hor
		 WHERE ctt_hor.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_hor.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_hor.DTAHORTRBCTT = TBLCTT.DTAADMTRACTT) as i_jornada,
		(SELECT MAX(ctt_cat.CODTIPPGT)
	      FROM TBLCTTTIPPGT as ctt_cat
		 WHERE ctt_cat.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_cat.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_cat.DTAFINCONTIPPGT = (SELECT MAX(ctt_cat_2.DTAFINCONTIPPGT)
	                                       FROM TBLCTTTIPPGT as ctt_cat_2
					                      WHERE ctt_cat_2.CODEMPFOL = ctt_cat.CODEMPFOL
					                        AND ctt_cat_2.MATEPGCTT = ctt_cat.MATEPGCTT) ) as categoria,
		(SELECT MIN(tblcttfaisal.VLRADIHRSATVCTTFAISAL)
           FROM TBLCTTFAISAL tblcttfaisal
          INNER JOIN (SELECT CODEMPFOL,
                             MATEPGCTT,
                             MIN(DTAINIFAISAL) AS DTAINIFAISAL
                        FROM TBLCTTFAISAL
                       GROUP BY CODEMPFOL, MATEPGCTT
                      ) tblcttfaisal2
             ON tblcttfaisal.CODEMPFOL = tblcttfaisal2.CODEMPFOL
            AND tblcttfaisal.MATEPGCTT = tblcttfaisal2.MATEPGCTT
            AND tblcttfaisal.DTAINIFAISAL = tblcttfaisal2.DTAINIFAISAL
          WHERE tblcttfaisal.CODEMPFOL = TBLCTT.CODEMPFOL
            AND tblcttfaisal.MATEPGCTT = TBLCTT.MATEPGCTT) as salario_horista,
		(SELECT MAX(ctt_tom.codpestom)
	       FROM TBLCTTTOM as ctt_tom
		  WHERE ctt_tom.CODEMPFOL = TBLCTT.CODEMPFOL
		    AND ctt_tom.MATEPGCTT = TBLCTT.MATEPGCTT
			AND ctt_tom.DTACTTTOM = (SELECT min(ctt_tom_2.DTACTTTOM)
	                                       FROM TBLCTTTOM as ctt_tom_2
					                      WHERE ctt_tom_2.CODEMPFOL = ctt_tom.CODEMPFOL
					                        AND ctt_tom_2.MATEPGCTT = ctt_tom.MATEPGCTT) ) as i_servicos,
       ( SELECT MAX( tblbco.nombco )
           FROM tblbco as tblbco
          WHERE tblbco.codbco = tblctt.codbcosal ) AS nome_banco,
       ( SELECT MAX( tblconcor.tipconcor )
           FROM tblconcor AS tblconcor
          WHERE tblconcor.codbco = tblctt.codbcosal
            AND tblconcor.codage = tblctt.codagesal
            AND tblconcor.codconcor = tblctt.codconcorsal
            AND ( tblconcor.digverconcor = tblctt.digverconcorsal OR tblconcor.digverconcor IS NULL ) ) AS tipo_conta,
		(SELECT MAX(tel.numtel)
           FROM TBLTEL as tel
		  WHERE tel.codpes = tblpes.codpes
		    AND tel.tippes = tblpes.tippes) as telefone_pessoa,
       (SELECT MAX(cid.dddcid)
          FROM TBLCID as cid
         WHERE cid.codcid = (SELECT MAX(tel.codcid)
                               FROM TBLTEL as tel
                              WHERE tel.codpes = tblpes.codpes
                                AND tel.tippes = tblpes.tippes) ) as ddd_pessoa,
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
		  WHERE cid.codcid = tblpes.NATPES ) as estado_nasc,
		(SELECT (SELECT HRSSEM FROM PRC_HRSQUAFIX(MAX(ctt_hor.CODHORTRB)))
	      FROM TBLHORTRBCTT as ctt_hor
		 WHERE ctt_hor.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_hor.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_hor.DTAHORTRBCTT = (SELECT MAX(ctt_hor_2.DTAHORTRBCTT)
	                                       FROM TBLHORTRBCTT as ctt_hor_2
					                      WHERE ctt_hor_2.CODEMPFOL = ctt_hor.CODEMPFOL
					                        AND ctt_hor_2.MATEPGCTT = ctt_hor.MATEPGCTT)) AS HORAS_SEM,
		(SELECT (SELECT HRSMEN FROM PRC_HRSQUAFIX(MAX(ctt_hor.CODHORTRB)))
	      FROM TBLHORTRBCTT as ctt_hor
		 WHERE ctt_hor.CODEMPFOL = TBLCTT.CODEMPFOL
		   AND ctt_hor.MATEPGCTT = TBLCTT.MATEPGCTT
		   AND ctt_hor.DTAHORTRBCTT = (SELECT MAX(ctt_hor_2.DTAHORTRBCTT)
	                                       FROM TBLHORTRBCTT as ctt_hor_2
					                      WHERE ctt_hor_2.CODEMPFOL = ctt_hor.CODEMPFOL
					                        AND ctt_hor_2.MATEPGCTT = ctt_hor.MATEPGCTT)) AS HORAS_MES,
        COALESCE((SELECT MIN(piso.VLRPISSAL)
				   FROM TBLPISSAL as piso
				  WHERE piso.CODSIN = TBLCTT.CODSIN
					AND piso.DTAPISSAL <= TBLCTT.DTAADMTRACTT), COALESCE((SELECT MIN(piso2.VLRITEFAISAL)
																   FROM TBLITEFAISAL as piso2,
																        TBLCTTFAISAL as piso_fun
																  WHERE piso2.CODFAISAL = piso_fun.CODFAISAL
																	AND piso_fun.MATEPGCTT = TBLCTT.MATEPGCTT
																	AND piso_fun.CODEMPFOL = TBLCTT.CODEMPFOL
																	AND piso2.DTAREA <= TBLCTT.DTAADMTRACTT),(SELECT MIN(piso2.VLRITEFAISAL)
																   FROM TBLITEFAISAL as piso2,
																        TBLCTTFAISAL as piso_fun
																  WHERE piso2.CODFAISAL = piso_fun.CODFAISAL
																	AND piso_fun.MATEPGCTT = TBLCTT.MATEPGCTT
																	AND piso_fun.CODEMPFOL = TBLCTT.CODEMPFOL
																	AND piso2.DTAREA <= CURRENT_DATE) )) as SALARIO_PISO_CONTRATUAL
  FROM TBLCTT
  LEFT JOIN tblepg
         ON tblepg.CODPESEPG = TBLCTT.CODPESEPG
  LEFT JOIN tblpes
         ON tblpes.CODPES = TBLCTT.CODPESEPG AND tblpes.TIPPES = TBLCTT.TIPPESEPG
ORDER BY TBLCTT.CODEMPFOL, TBLCTT.MATEPGCTT
