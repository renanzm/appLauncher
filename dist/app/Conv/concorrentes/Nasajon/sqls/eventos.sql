SELECT empresa, evento, codigo, nome, tipovalor, unidade, percentual, tipomedia
FROM persona.eventos
where tipomedia <> 0

order by 1,2