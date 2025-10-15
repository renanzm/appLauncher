select ger_empresa.codigo,
       mfp_empresa.dt_inicio_esocial
  from mfp_empresa
 inner join ger_empresa
    on ger_empresa.id = mfp_empresa.id_ger_empresa
 where mfp_empresa.dt_inicio_esocial is not null
 order by ger_empresa.codigo;