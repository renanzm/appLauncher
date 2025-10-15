select distinct [C�digo da empresa],
       LTRIM(RTRIM([Cargo])) as Cargo,
       [Cbo2]
  from Movimento
 where [Cargo] is not null
   and [Cargo] != ''

UNION

select distinct [C�digo da empresa],
       LTRIM(RTRIM([Cargo temp])) as Cargo,
       [Cbo2]
  from [Funcion�rios]
 where [Cargo temp] is not null
   and [Cargo temp] != ''
order by 1, 2, 3 DESC