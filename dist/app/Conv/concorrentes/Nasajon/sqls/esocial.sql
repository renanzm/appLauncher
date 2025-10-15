select eve.empresa,
       eve.chave,
       eve.tipo,
       ret.numerorecibo,
	   eve.iniciovalidade
  from esocial.loteseventos lot
 inner join esocial.eventos eve
    on lot.evento = eve.evento
 inner join esocial.retornos ret
    on lot.loteevento = ret.loteevento
 where tipo in ('S-1000', 'S-1005', 'S-1020', 'S-1030', 'S-2200', 'S-2205', 'S-2206', 'S-2230','S-2300')
   and numerorecibo <> ''
   and left(numerorecibo, 3) = '1.1'
 order by eve.empresa, eve.tipo;