SELECT distinct substring( chv_colaborador , 6 , STRPOS( substring(chv_colaborador , 6 ) , '|' )-1 ) as empresa,
       substring( chv_colaborador , 6 + STRPOS( substring(chv_colaborador , 6 ), '|' ), length(chv_colaborador)  )  as codigo_jornada,
	   codigo_quadro,
	   dia
  FROM public.esocial_colaborador_quadro_horario_item
order by 1,2,4,3