SELECT mfp_vinculo_trabalhador.*,
mfp_trabalhador_cargo.id_mfp_trabalhador,
REPLACE(mfp_cargo.descricao , '	', '' ) as descricao,
mfp_cargo.codigo,
mfp_cargo.id_mfp_cbo,
mfp_cargo.codigo_esocial,
mfp_cbo.codigo as cbo
FROM public.mfp_vinculo_trabalhador
LEFT JOIN PUBLIC.mfp_trabalhador_cargo
on mfp_trabalhador_cargo.id = mfp_vinculo_trabalhador.id_mfp_trabalhador_cargo
LEFT JOIN PUBLIC.mfp_cargo
on mfp_cargo.id = mfp_vinculo_trabalhador.id_mfp_cargo
LEFT JOIN PUBLIC.mfp_cbo
on mfp_cbo.id = mfp_cargo.id_mfp_cbo
order by id_mfp_trabalhador, dt_alteracao