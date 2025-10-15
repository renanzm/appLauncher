select tblotacao.idempresa,
		tblotacao.idestabelecimento,
		tblotacao.idlotacao,
		tblotacao.fllogradouro,
		tblotacao.dslogradouro,
		tblotacao.dscplogradouro,
		tblotacao.nrlogradouro,
		tblotacao.nmbairro,
		tblotacao.nmcidade,
		tblotacao.cdibgecidade,
		tblotacao.nrcep,
		tblotacao.fluf,
		tblotacao.iddepartamento,
		tblotacao.idgrupolcto,
		tblotacao.idcentrocustocontabil,
		tblotacao.cdprefixorais,
		tblotacao.idlotacaoconversao,
		tblotacao.flstatusesocial,
		tblotacao.flinativa,
		tblotacao.ddinicioponto,
		tblotacao.idesocial,
		tblotacaodetalhe.dslotacao,
		tblotacaodetalhe.dtinicio,
		tblotacaodetalhe.dtfim,
		tblotacaodetalhe.fllotacao,
		tblotacaodetalhe.idobra,
		tblotacaodetalhe.cdfpas,
		tblotacaodetalhe.cdterceiros,
		tblotacaodetalhe.flindsimples,
		tblotacaodetalhe.idpessoa,
		tblotacaodetalhe.cdsefip,
		tblotacaodetalhe.nrgps,
		tblotacaodetalhe.nrgpsterceiros,
		tblotacaodetalhe.txterceiros,
		tblotacaodetalhe.txinss,
		tblotacaodetalhe.nrcno,
		tblotacaodetalhe.nrinsccontratante,
		tblotacaodetalhe.nmcontratante,
		tblotacaodetalhe.nrinscproprietario,
		tblotacaodetalhe.nmproprietario,
		tblotacaodetalhe.idusuario,
		tblotacaodetalhe.cdterceirosesocial,
		tblotacaodetalhe.cdterceirossuspenso,
		tblotacaodetalhe.idprocessosuspterceiro,
		tbobra.idestabelecimento,
		tbobra.nrcno,
		tbobra.dsobra,
		tbobra.fllogradouro,
		tbobra.dslogradouro,
		tbobra.dscplogradouro,
		tbobra.nrlogradouro,
		tbobra.nmbairro,
		tbobra.nmcidade,
		tbobra.cdibgecidade,
		tbobra.nrcep,
		tbobra.fluf,
		tbobra.flstatusesocial,
		tbobra.hashcode,
		tbobra.idusuario,
		tbobra.fltipocnocaepf,
		tbobra.nrcnocaepf,
		tbobra.flinativa,
		tbobra.flremove,
		tbobra.idconversao,
		tbobra.nrceisefip,
		tbestabelecimento.cdcnae,
		tbestabelecimento.txfap,
		tbestabelecimento.txrat
from dbo.tblotacao inner join tblotacaodetalhe
                             on tblotacaodetalhe.idempresa = tblotacao.idempresa
							and tblotacaodetalhe.idlotacao = tblotacao.idlotacao
							and tblotacaodetalhe.idestabelecimento = tblotacao.idestabelecimento
							and tblotacaodetalhe.dtinicio = (select top (1) sub.dtinicio
									 from dbo.tblotacaodetalhe as sub
									where sub.idempresa = tblotacaodetalhe.idempresa
									  and sub.idlotacao = tblotacaodetalhe.idlotacao
									  and sub.idestabelecimento = tblotacaodetalhe.idestabelecimento
									order by 1 desc)
							left join dbo.tbobra
							       on tblotacaodetalhe.idobra = tbobra.idobra
							left join dbo.tbestabelecimento
								   on tbestabelecimento.idestabelecimento = tbobra.idestabelecimento
								and tbestabelecimento.dtinicio = (select top (1) sub.dtinicio
									 from dbo.tbestabelecimento as sub
									where sub.idestabelecimento = tblotacaodetalhe.idestabelecimento
									order by 1 desc)
order by 1, 2, 3