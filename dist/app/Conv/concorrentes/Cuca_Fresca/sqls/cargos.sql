SELECT tbcargoemp.id_empresa,
       tbtpcarg.codcargo,
	   tbcargoemp.id_tbcargoemp,
       tbtpcarg.descricao,
       tbtpcarg.codcbo
FROM dpcuca.tbcargoemp
INNER JOIN dpcuca.tbtpcarg
ON tbcargoemp.id_tbtpcarg = tbtpcarg.id_tbtpcarg
ORDER BY 1, 2