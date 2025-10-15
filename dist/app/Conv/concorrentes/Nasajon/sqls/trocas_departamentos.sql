select trabalhadores.empresa,
       mudancastrabalhadores.trabalhador,
       mudancastrabalhadores.datainicial,
       mudancastrabalhadores.departamento
  from persona.mudancastrabalhadores
 inner join persona.trabalhadores
    on trabalhadores.trabalhador = mudancastrabalhadores.trabalhador
 where mudancastrabalhadores.departamento is not null
 order by 1, 2;