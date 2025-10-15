SELECT '{empresa}' AS EMPRESA,
	   codfun,
	   daquisiini AS iniaqui_original,
	   TO_CHAR(daquisiini, 'DD/MM/YYYY') AS iniaqui,
	   TO_CHAR(daquisiini + 700, 'DD/MM/YYYY') AS data_limite_gozo,
	   TO_CHAR(daquisifim, 'DD/MM/YYYY') AS fimaqui,
	   (dgozofim - dgozoini + 1) AS reffer,
	   TO_CHAR(dgozoini, 'DD/MM/YYYY') AS inigoz,
	   TO_CHAR(dgozofim, 'DD/MM/YYYY') AS fimgoz,
	   CASE WHEN (dabonoini) is null
			THEN
				'NAO'
		    ELSE
				'SIM'
		END AS abono,
	   (dabonofim - dabonoini + 1) AS refabo,
	   TO_CHAR(dabonoini, 'DD/MM/YYYY') AS iniabo,
	   TO_CHAR(dabonofim, 'DD/MM/YYYY') AS fimabo,
	   TO_CHAR(drecibo, 'DD/MM/YYYY') AS dtrecibo,
	   '12' AS avos,
	   nfaltas AS faltas,
	   '1' AS tipo,
	   (dgozoini - date '1900-01-01') AS dias_ini_gozo,
	   (dgozofim - date '1900-01-01') AS dias_fim_gozo
FROM f{empresa}.hist_ferias 
WHERE cstatus <> 'P'

UNION

SELECT '{empresa}' AS EMPRESA,
	   SUBSTRING(composto, 7, 6) AS codfun,
	   peraquiini AS iniaqui_original,
	   TO_CHAR(peraquiini, 'DD/MM/YYYY') AS iniaqui,
	   TO_CHAR(peraquiini + 700, 'DD/MM/YYYY') AS data_limite_gozo,
	   TO_CHAR(peraquifim, 'DD/MM/YYYY') AS fimaqui,
	   direitobrt AS reffer,
	   TO_CHAR(date((SELECT DTRES -1 FROM f{empresa}.func WHERE f{empresa}.func.codfun = SUBSTRING(composto, 7, 6)) - CAST(direitobrt AS integer)), 'DD/MM/YYYY') AS inigoz,
	   TO_CHAR((SELECT DTRES -2 FROM f{empresa}.func WHERE f{empresa}.func.codfun = SUBSTRING(composto, 7, 6)), 'DD/MM/YYYY') AS fimgoz,
	   'NÃO' AS abono, 
	   0.0 AS refabo,
	   '' AS iniabo, 
	   '' AS fimabo,
	   TO_CHAR((SELECT DTRES -2 FROM f{empresa}.func WHERE f{empresa}.func.codfun = SUBSTRING(composto, 7, 6)), 'DD/MM/YYYY') AS dtrecibo,
	   avos,
	   faltas,
	   '3' AS tipo,
	   (date((SELECT DTRES -1 FROM f{empresa}.func WHERE f{empresa}.func.codfun = SUBSTRING(composto, 7, 6)) - CAST(direitobrt AS integer)) - date '1900-01-01') AS dias_ini_gozo,
	   ((SELECT DTRES -2 FROM f{empresa}.func WHERE f{empresa}.func.codfun = SUBSTRING(composto, 7, 6)) - date '1900-01-01') AS dias_fim_gozo
FROM f{empresa}.rescfer
WHERE avos <= 12
ORDER BY 2, 3