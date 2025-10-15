select tbcargodetalhe.idempresa,
		tbcargodetalhe.idcargo,
		tbcargodetalhe.cdcbo,
		tbcargodetalhe.dscargo,
		tbcargo.dsatividade
from dbo.tbcargodetalhe left join dbo.tbcargo
                               on tbcargodetalhe.idempresa = tbcargo.idempresa
							   and tbcargodetalhe.idcargo = tbcargo.idcargo
where dtinicio = (select top (1) sub.dtinicio
					from dbo.tbcargodetalhe as sub
				where sub.idempresa = tbcargodetalhe.idempresa
					and sub.idcargo = tbcargodetalhe.idcargo
				order by 1 desc)
order by 1, 2