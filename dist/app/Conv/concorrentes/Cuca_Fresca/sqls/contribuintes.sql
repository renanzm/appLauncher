SELECT codigoempresa as cod_empresa, 
       socios.*,
       (select codcbo from dpcuca.tbcbo where tbcbo.id_tbcbo = socios.id_tbcbo) as codcbo,
	   (select max(valor) from dpcuca.lancsoc where lancsoc.codigoempresa = socios.codigoempresa 
		and lancsoc.codsocio = socios.codigosocio
	   	and evento = 1) as salario,
       (select codsetor from dpcuca.tbtpsetor where tbtpsetor.id = socios.id_tbtpsetor) as codsetor,
       (select cod_tbocorrencia from dpcuca.tbocorrencias where tbocorrencias.id_tbocorrencias = socios.id_tbocorrencia) as codocorrencia
FROM dpcuca.socios
WHERE codigodacategoria <> 0
ORDER BY codigoempresa, codigosocio