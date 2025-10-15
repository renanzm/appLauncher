SELECT chv_colaborador,   
       aquisitivo_inicio,
       aquisitivo_fim,
       gozo_inicio,
       gozo_fim,       
       data_aviso,
       data_recebimento,
       dias_abono,
       dias_descanso,
       dias_direito,
       dias_restantes,
       faltas 
  
  FROM public.rh_ferias
 
 order by 1,2,4