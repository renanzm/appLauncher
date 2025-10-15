select trabalhadores.empresa,
       mudancastrabalhadores.trabalhador,
       mudancastrabalhadores.datainicial,
       mudancastrabalhadores.estabelecimento
  from persona.mudancastrabalhadores
 inner join persona.trabalhadores
    on trabalhadores.trabalhador = mudancastrabalhadores.trabalhador
 where mudancastrabalhadores.estabelecimento is not null
 order by 1, 2;