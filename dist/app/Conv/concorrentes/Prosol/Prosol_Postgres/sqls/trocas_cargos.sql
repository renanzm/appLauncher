select chv_colaborador,
       data_alteracao,		
       funcao,
       funcao_descricao,
       motivo_alteracao
  FROM public.rh_alteracao_salarioefuncao
 where excluido = 'False'
  order by 1,2,5