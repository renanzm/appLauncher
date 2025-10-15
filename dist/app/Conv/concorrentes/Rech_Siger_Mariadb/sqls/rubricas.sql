select peve_cod,
       peve_des,
       peve_tipo,
       peve_avfe,
       peve_proc
  from pevent
 where peve_irrf = 'M'
 order by peve_cod;