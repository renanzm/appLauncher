SELECT  codigoempresa, 
		codigoempregado, 
		dataaltcarg, 
		(SELECT codcargo FROM dpcuca.tbtpcarg WHERE tbtpcarg.id_tbtpcarg = altcarg.id_tbtpcarg) AS cargofuncao,
		(SELECT codsetor FROM dpcuca.tbtpsetor WHERE tbtpsetor.id = altcarg.id_tbtpsetor) AS codsetor,
		(SELECT cod_tbocorrencia FROM dpcuca.tbocorrencias WHERE tbocorrencias.id_tbocorrencias = altcarg.id_tbocorrencias) AS codigoocorrencia,
		vinculo,
		grauinstrcao,
		hrssem,
		horentr,
		intervalo,
		retorno,
		horsaida,
		sabentrada,
		sabsaida,
		sabentrada2,
		sabsaida2
FROM dpcuca.altcarg
ORDER BY 1, 2, 3