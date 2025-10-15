select carg.id_mfp_trabalhador,
       to_date(refe.referencia::text || '01', 'YYYYMMDD') as competencia,
       even.codigo,
       even.descricao,
       case
         when even.referencia = '<Horas>' then 'H'
         when even.referencia = '<Dias>' then 'D'
         else 'V'
       end as referencia_evento,
       case
         when even.acumula_decimo_terceiro then 'S'
         else 'N'
       end as acumula_decimo_terceiro,
       case
         when even.acumula_ferias_recisao then 'S'
         else 'N'
       end as acumula_ferias_recisao,
       form.variavel as referencia,
       form.valor
  from public.mfp_calculo_formula form
 inner join public.mfp_calculo_referencia refe
    on refe.id = form.id_calculo_referencia
 inner join public.mfp_calculo_evento calc
    on calc.id_calculo_formula = form.id
 inner join public.mfp_trabalhador_cargo carg
    on carg.id = form.id_trabalhador_cargo
 inner join public.mfp_evento even
    on even.id = calc.id_evento
 where form.valor > 0
   and refe.tipo_calculo = 1
   and even.tipo = 1
   and form.principal = true
   and extract(year from to_date(refe.referencia::text || '01', 'YYYYMMDD')) > (extract(year from current_date) - 3)
 order by 1, 2, 3;
