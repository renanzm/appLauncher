SELECT mfp_ferias.*,
mfp_trabalhador_cargo.id_mfp_trabalhador 
FROM public.mfp_ferias
LEFT JOIN public.mfp_trabalhador_cargo
      ON mfp_trabalhador_cargo.id = mfp_ferias.id_mfp_trabalhador_cargo