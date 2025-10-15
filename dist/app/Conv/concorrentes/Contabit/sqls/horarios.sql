select tbhorario.idempresa,
        tbhorario.idhorario,
        nmhorario,
        tbhorario.idesocial,
        tbhorariodetalhe.dtinicio,
        fltipointervalo,
        hriniintervalo,
        hrterintervalo,
        hrentrada,
        hrsaida,
        flhrflexivel,
        totalminutoshorario,
		totalminutosintervalo
from dbo.tbhorario left join dbo.tbhorariodetalhe
						  on tbhorario.idempresa = tbhorariodetalhe.idempresa
						 and tbhorario.idhorario = tbhorariodetalhe.idhorario
order by 1, 2
