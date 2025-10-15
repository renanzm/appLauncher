SELECT trabalhador, evento, ano, mes, referencia, valor
	FROM persona.calculostrabalhadores
where exists(select 1 from persona.eventos where eventos.evento = calculostrabalhadores.evento and tipomedia <> 0)
order by 1,3,4,2