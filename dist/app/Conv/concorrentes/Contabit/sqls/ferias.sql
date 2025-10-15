select idempresa,
	   idtrabalhador,
	   dtaquisitivoinicio,
	   dtaquisitivofinal,
	   dtinicioferias,
	   dtfinalferias,
	   dtinicioabono,
	   dtfinalabono,
	   qtdiasferias,
	   qtdiasabono,
	   qtdiasfalta
from tbtrabalhadorferias
order by 1, 2, 3, 5