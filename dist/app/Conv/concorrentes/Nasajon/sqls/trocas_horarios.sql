select trabalhadores.empresa,
       mudancastrabalhadores.trabalhador,
       mudancastrabalhadores.datainicial,
       mudancastrabalhadores.horario
  from persona.mudancastrabalhadores
 inner join persona.trabalhadores
    on trabalhadores.trabalhador = mudancastrabalhadores.trabalhador
 where mudancastrabalhadores.horario is not null
 order by 1, 2;