with max_data_inicio_soc as (
	select codigoempresa,
	       max(data_inicio) as data_inicio
	from dpcuca.forma_pagamento_s
	group by codigoempresa
)
select pag_soc.codigoempresa,
	   pag_soc.data_inicio,
	   '2' as tipo,
	   pag_soc.forma
from dpcuca.forma_pagamento_s as pag_soc
inner join max_data_inicio_soc
	on pag_soc.codigoempresa = max_data_inicio_soc.codigoempresa
	and pag_soc.data_inicio = max_data_inicio_soc.data_inicio
order by 1, 2