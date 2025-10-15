select distinct tbtrabalhador.idempresa,
		tbtrabalhadordetalhe.dsstrhorarioesocial,
        tbtrabalhadordetalhe.fltipojornada,
		tbtrabalhadordetalhe.idhorario1,
		tbtrabalhadordetalhe.idhorario2,
		tbtrabalhadordetalhe.idhorario3,
		tbtrabalhadordetalhe.idhorario4,
		tbtrabalhadordetalhe.idhorario5,
		tbtrabalhadordetalhe.idhorario6,
		tbtrabalhadordetalhe.idhorario7
  from dbo.tbtrabalhador inner join dbo.tbtrabalhadordetalhe
                                 on tbtrabalhador.idempresa = tbtrabalhadordetalhe.idempresa
								and tbtrabalhador.idcolaborador = tbtrabalhadordetalhe.idcolaborador
								and tbtrabalhador.idtrabalhador = tbtrabalhadordetalhe.idtrabalhador
								and tbtrabalhadordetalhe.dtinicio = (select top (1) sub.dtinicio
											 from dbo.tbtrabalhadordetalhe as sub
											where sub.idempresa = tbtrabalhadordetalhe.idempresa
											  and sub.idtrabalhador = tbtrabalhadordetalhe.idtrabalhador
											  and sub.idcolaborador = tbtrabalhadordetalhe.idcolaborador
											order by 1 desc)
where not idhorario1 is null
  or not idhorario2 is null
  or not idhorario3 is null
  or not idhorario4 is null
  or not idhorario5 is null
  or not idhorario6 is null
  or not idhorario7 is null
order by 1, 2