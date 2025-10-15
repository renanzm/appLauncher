SELECT distinct substring( chv_colaborador , 6 , STRPOS( substring(chv_colaborador , 6 ) , '|' )-1 ) as empresa,
       codigo,      
	   inicio,
	   termino
	   
  FROM public.esocial_colaborador_quadro_horario_item inner join public.esocial_quadro_horarios
           on esocial_colaborador_quadro_horario_item.codigo_quadro = esocial_quadro_horarios.codigo
		                                              inner join public.esocial_quadro_horarios_intervalos
           on esocial_quadro_horarios_intervalos.codigo_quadro = esocial_quadro_horarios.codigo
		   
	where inicio_intervalo is null
  
  order by 1,2,3