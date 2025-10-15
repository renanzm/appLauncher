select distinct [Código da empresa],
       LTRIM(RTRIM([Cargo])) as Cargo,
       [Cbo2]
  from Movimento
 where [Cargo] is not null
   and [Cargo] != ''

UNION

select distinct [Código da empresa],
       LTRIM(RTRIM([Cargo temp])) as Cargo,
       [Cbo2]
  from [Funcionários]
 where [Cargo temp] is not null
   and [Cargo temp] != ''
order by 1, 2, 3 DESC