with max_data_inicio_func as (
	select codigoempresa,
	       max(data_inicio) as data_inicio
	from dpcuca.forma_pagamento_f
	group by codigoempresa
)
select pag_func.codigoempresa,
	   pag_func.data_inicio,
	   '1' as tipo,
	   pag_func.forma
from dpcuca.forma_pagamento_f as pag_func
inner join max_data_inicio_func
	on pag_func.codigoempresa = max_data_inicio_func.codigoempresa
	and pag_func.data_inicio = max_data_inicio_func.data_inicio
order by 1, 2