select [Código da empresa],
       Matrícula,
	   [Mês de referência],
	   [Descrição do setor],
	   [Código do tomador],
	   Sindicato
from Movimento
order by [Código da empresa], Matrícula, Mesref
