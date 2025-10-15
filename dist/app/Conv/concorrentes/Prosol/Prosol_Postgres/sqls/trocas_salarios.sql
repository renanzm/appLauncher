select chv_colaborador,
       data_alteracao,
       dissidio,
       motivo_alteracao,
       salario_atual
  FROM public.rh_alteracao_salarioefuncao
 where excluido = 'False'
  order by 1,2,5