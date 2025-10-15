SELECT id,
       REPLACE( descricao , '	', '' ) as descricao,
	   codigo,
	   id_mfp_cbo,
	   codigo_esocial 
  FROM public.mfp_cargo