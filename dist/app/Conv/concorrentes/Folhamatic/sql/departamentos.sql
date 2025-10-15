SELECT '{empresa}' AS EMPRESA,
	   CODDEPTO,
	   LOCAL,
	   DEPSETSEC,
	   SETOR,
	   SECAO,
	   CGC,
	   ENDER,
	   CIDADE,
	   CEP,
	   UF,
	   CODGPS,
	   PERCTERC,
	   PERCSAT,
	   PERCINSS,
	   BAIRRODEP,
	   CODMUNIC
FROM f{empresa}.depto
where TPLOTACAO = '01' or DEPSETSEC = '000100000000'
order by 1,2