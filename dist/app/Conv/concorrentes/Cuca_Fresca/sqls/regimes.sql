with max_data_inicio as (
	select codigoempresa,
	       max(datainicio) as datainicio
	from dpcuca.tipoempr
	group by codigoempresa
)
select tipoempr.codigoempresa,
       tipoempr.datainicio,
	   tipoempr.porte,
	   tipoempr.tipo,
	   tipoempr.id_classif_tribut
from dpcuca.tipoempr
inner join max_data_inicio
	on tipoempr.codigoempresa = max_data_inicio.codigoempresa
	and tipoempr.datainicio = max_data_inicio.datainicio
order by 1, 2