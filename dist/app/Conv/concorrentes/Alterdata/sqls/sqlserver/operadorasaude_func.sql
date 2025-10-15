select wdp.funcionarioplanosaude.idempresa,
       wdp.funcionarioplanosaude.tipo,
       wdp.planosaudem.codigo,
       wdp.funcionarioplanosaude.idfuncionario,
       wdp.funcionarioplanosaude.iddependente,
       wdp.plano_saude_beneficiario_rubrica.vigencia_inicial,
       wdp.plano_saude_beneficiario_rubrica.vigencia_final
  from wdp.plano_saude_beneficiario_rubrica
  left join wdp.funcionarioplanosaude
    on wdp.funcionarioplanosaude.id = wdp.plano_saude_beneficiario_rubrica.plano_saude_funcionario_id
  left join wdp.planosaudem
    on wdp.planosaudem.id = wdp.funcionarioplanosaude.idplanosaude
 where wdp.plano_saude_beneficiario_rubrica.vigencia_inicial is not null;