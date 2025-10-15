SELECT mfp_trabalhador_cargo_salario.*,
mfp_trabalhador_cargo.id_mfp_trabalhador
  FROM public.mfp_trabalhador_cargo_salario
LEFT JOIN public.mfp_trabalhador_cargo
ON public.mfp_trabalhador_cargo_salario.id_mfp_trabalhador_cargo = mfp_trabalhador_cargo.id
order by 7 asc,2 asc, 8 desc