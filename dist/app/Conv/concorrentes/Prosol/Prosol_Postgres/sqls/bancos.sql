 SELECT distinct agencia, agencia_digito, banco
  FROM public.rh_colaborador_banco
  where not agencia is null and not banco is null
  
  order by 3,1