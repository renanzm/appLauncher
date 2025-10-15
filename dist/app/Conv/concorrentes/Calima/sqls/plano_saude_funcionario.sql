select mfp_trabalhador_cargo.id_mfp_trabalhador,
       mfp_trabalhador_cargo_plano_saude.id_mfp_plano_saude,
       mfp_trabalhador_cargo_plano_saude.dt_inicio,
       mfp_trabalhador_cargo_plano_saude.dt_fim
  from mfp_trabalhador_cargo_plano_saude
 inner join mfp_trabalhador_cargo
    on mfp_trabalhador_cargo.id = mfp_trabalhador_cargo_plano_saude.id_mfp_trabalhador_cargo
 order by id_mfp_trabalhador_cargo,
          dt_inicio;