with max_historico as (
	select idempresa,
	       max(dtinicial) as dtinicial
	from wdp.empdphistorico
	group by idempresa
)
select empdphistorico.idempresa,
       empdphistorico.stmicroempresapeqporte,
       empdphistorico.stimpostosimplesgrps
from wdp.empdphistorico
inner join max_historico
	on max_historico.idempresa = empdphistorico.idempresa
	and max_historico.dtinicial = empdphistorico.dtinicial
order by 1