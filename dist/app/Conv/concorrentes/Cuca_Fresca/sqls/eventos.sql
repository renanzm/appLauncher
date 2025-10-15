SELECT empresas.id_empresa,
       eventos.evento,
	   eventos.descricao,
	   (select max(rub.valor) from dpcuca.tbrubric as rub where rub.codigo = eventos.rubrica_homolognet) as valor,
	   (select max(rub.quantidade) from dpcuca.tbrubric as rub where rub.codigo = eventos.rubrica_homolognet) as horas,
	   (select max(rub.percentual) from dpcuca.tbrubric as rub where rub.codigo = eventos.rubrica_homolognet) as percentual
  FROM dpcuca.empresas,
       dpcuca.tbdsceve as eventos    
ORDER BY 1, 2