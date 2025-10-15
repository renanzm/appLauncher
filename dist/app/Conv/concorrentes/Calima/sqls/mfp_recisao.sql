SELECT mfp_recisao.*,
mfp_trabalhador_cargo.id_mfp_trabalhador
FROM public.mfp_recisao
LEFT JOIN public.mfp_trabalhador_cargo
      ON mfp_trabalhador_cargo.id = mfp_recisao.id_mfp_trabalhador_cargo