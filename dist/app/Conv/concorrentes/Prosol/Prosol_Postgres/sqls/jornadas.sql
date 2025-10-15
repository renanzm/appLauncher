SELECT distinct substring( chv_colaborador , 6 , STRPOS( substring(chv_colaborador , 6 ) , '|' )-1 ) as empresa,
       substring( chv_colaborador , 6 + STRPOS( substring(chv_colaborador , 6 ), '|' ), length(chv_colaborador)  )  as codigo_jornada,
       descricao_jornada,
	   (select max(o.observacoes)
		  from esocial_quadro_horarios as o 
		 where o.codigo = substring( chv_colaborador , 6 + STRPOS( substring(chv_colaborador , 6 ), '|' ), length(chv_colaborador))) as observacao
		 
  FROM public.esocial_colaborador_quadro_horario
  
order by 1,3,2