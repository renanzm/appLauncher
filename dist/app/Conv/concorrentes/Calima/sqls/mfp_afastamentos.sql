SELECT MFP_TRABALHADOR_CARGO_MOVIMENTACAO.*,
mfp_trabalhador_cargo.id_mfp_trabalhador
  FROM MFP_TRABALHADOR_CARGO_MOVIMENTACAO
 LEFT JOIN public.mfp_trabalhador_cargo
      ON mfp_trabalhador_cargo.id = MFP_TRABALHADOR_CARGO_MOVIMENTACAO.id_mfp_trabalhador_cargo
WHERE AFASTAMENTO in ('N1','N2','O1','O2','O3','P1','P2','P3','Q1','Y','X')