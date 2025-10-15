select mfp_instituicao_ensino.*,
       ger_cep_bairro.bairro
  from mfp_instituicao_ensino
  join ger_cep_bairro
    on ger_cep_bairro.id = mfp_instituicao_ensino.id_ger_cep_bairro
 order by codigo;