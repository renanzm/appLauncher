select '{empresa}' AS EMPRESA,
       holerith.codfun,
       holerith.anomes,
       holerith.codeven,
       holerith.ref,
       holerith.valor,
       eventos.rotina
  from f{empresa}.holerith
 inner join genfolha.eventos
    on genfolha.eventos.cod = f{empresa}.holerith.codeven
 where holerith.anomes ~ '^[0-9]+$'
   and cast(holerith.anomes as integer) > cast((extract(year from current_date) - 2) || '01' as integer)
   and holerith.proced = 'M'
 order by 1, 2, 3