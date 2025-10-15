SELECT distinct substring( chv_colaborador , 6 , STRPOS( substring(chv_colaborador , 6 ) , '|' )-1 ) as empresa,
       codigo,
       nome,
	   hora_entrada,
	   inicio_intervalo,
	   hora_saida,
	   termino_intervalo,
	   descanso_minutos,
	   jornada_minutos
	   
  FROM public.esocial_colaborador_quadro_horario_item inner join public.esocial_quadro_horarios
           on esocial_colaborador_quadro_horario_item.codigo_quadro = esocial_quadro_horarios.codigo
  
  order by 1,3