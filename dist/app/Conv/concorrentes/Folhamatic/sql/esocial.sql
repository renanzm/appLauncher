SELECT '{empresa}' AS EMPRESA,
	   chave,
	   protocolo,
	   fk_codtipo,
	   codfun,
	   (SELECT MAX(MATRIC_ANT) FROM f{empresa}.funcdoc WHERE esocialtransmissao.codfun = funcdoc.codfun),
	   dtrefer
FROM f{empresa}.esocialtransmissao
WHERE f{empresa}.esocialtransmissao.fk_codtipo IN ('S-1000','S-1020','S-1030','S-1050','S-2200','S-2205','S-2206','S-2300') AND
	  protocolo <> ''
	  
UNION

SELECT '{empresa}' AS EMPRESA,
	   chave,
	   rec_esocia,
	   fk_codtipo,
	   codfun,
	   (SELECT MAX(MATRIC_ANT) FROM f{empresa}.funcdoc WHERE esocialtransmissao.codfun = funcdoc.codfun),
	   dtrefer
FROM f{empresa}.esocialtransmissao,f{empresa}.eventotransmissaoesocial
WHERE f{empresa}.esocialtransmissao.fk_codtipo IN ('S-1000','S-1020','S-1030','S-1050','S-2200','S-2205','S-2206','S-2300') AND
	  protocolo = ''
	  and esocialtransmissao.id_evento = eventotransmissaoesocial.id_evento

UNION

SELECT '{empresa}' AS EMPRESA,
	   substring(chave, 1, 6),
	   protocolo,
	   fk_codtipo,
	   codfun,
	   (SELECT MAX(MATRIC_ANT) FROM f{empresa}.funcdoc WHERE esocialtransmissao.codfun = funcdoc.codfun),
	   dtrefer
FROM f{empresa}.esocialtransmissao
WHERE f{empresa}.esocialtransmissao.fk_codtipo IN ('S-2230') AND
	  protocolo <> ''

ORDER BY 1, 3
