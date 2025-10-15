select idempresa,
	   idtrabalhador,
	   dtafastamento,
	   dtretorno,
	   flmotivoafastamento,
	   dtinclusao,
	   idtrabafastamento
from dbo.tbtrabalhadorafastamento
inner join dbo.tbmotivomvtotrab
	on tbmotivomvtotrab.fltipo = 'afa'
	and tbmotivomvtotrab.idmotivomvtotrab = tbtrabalhadorafastamento.flmotivoafastamento
order by idempresa, idtrabalhador, dtafastamento