 select CODIG_MATRIZ as codi_emp,
 '' as codigo,
 NUMERO_DO_RECIBO as recibo,
 '' as codigo_esocial,
 right(cd_evento,4) as evento,
 '' as data
 from tblsinteticoesocial
 where CD_EVENTO IN ('S-1000')
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 
 union
 
 select CODIG_MATRIZ as codi_emp,
 CODIG_CARG as codigo,
 NUMERO_DO_RECIBO as recibo,
 CODIG_CARG as codigo_esocial,
 right(cd_evento,4) as evento,
 '' as data
 from tblsinteticoesocial
 where CD_EVENTO = 'S-1030'
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 
 union
 
 select CODIG_MATRIZ as codi_emp,
 CODIG_FUNC as codigo,
 NUMERO_DO_RECIBO as recibo,
 MATRESOCIAL_FUNC as codigo_esocial,
 right(cd_evento,4) as evento,
 '' as data
 from tblsinteticoesocial
 where CD_EVENTO = 'S-2200'
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 and CODIG_FUNC not in ('', 0) 
 
 union
 
 select CODIG_MATRIZ as codi_emp,
 CODIG_FUNC as codigo,
 NUMERO_DO_RECIBO as recibo,
 MATRESOCIAL_FUNC as codigo_esocial,
 right(cd_evento,4) as evento,
 '' as data
 from tblsinteticoesocial
 where CD_EVENTO = 'S-2300'
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 and CODIG_FUNC not in ('', 0)
 
 union
 
 select CODIG_MATRIZ as codi_emp,
 CODIG_EMPR as codigo,
 NUMERO_DO_RECIBO as recibo,
 MATRESOCIAL_FUNC as codigo_esocial,
 right(cd_evento,4) as evento,
 DT_INI_MOVTO_EVENTO as data
 from tblsinteticoesocial
 where CD_EVENTO = 'S-1005'
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 
 union
 
 select CODIG_MATRIZ as codi_emp,
 CODIG_EMPR as codigo,
 NUMERO_DO_RECIBO as recibo,
 MATRESOCIAL_FUNC as codigo_esocial,
 right(cd_evento,4) as evento,
 DT_INI_MOVTO_EVENTO as data
 from tblsinteticoesocial
 where CD_EVENTO = 'S-1020'
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 
 union
 
 select CODIG_MATRIZ as codi_emp,
 CODIG_FUNC as codigo,
 NUMERO_DO_RECIBO as recibo,
 MATRESOCIAL_FUNC as codigo_esocial,
 right(cd_evento,4) as evento,
 DT_INI_MOVTO_EVENTO as data
 from tblsinteticoesocial
 where CD_EVENTO = 'S-2230'
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 and CODIG_FUNC not in ('', 0)
 
 union
 
 select CODIG_MATRIZ as codi_emp,
 CODIG_FUNC as codigo,
 NUMERO_DO_RECIBO as recibo,
 MATRESOCIAL_FUNC as codigo_esocial,
 right(cd_evento,4) as evento,
 DT_INI_MOVTO_EVENTO as data
 from tblsinteticoesocial
 where CD_EVENTO = 'S-2205'
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 and CODIG_FUNC not in ('', 0)
 
 union
 
 select CODIG_MATRIZ as codi_emp,
 CODIG_FUNC as codigo,
 NUMERO_DO_RECIBO as recibo,
 MATRESOCIAL_FUNC as codigo_esocial,
 right(cd_evento,4) as evento,
 DT_INI_MOVTO_EVENTO as data
 from tblsinteticoesocial
 where CD_EVENTO = 'S-2206'
 and NUMERO_DO_RECIBO <> ''
 and TIPO_AMBIENTE = 1
 and CODIG_FUNC not in ('', 0)

group by codi_emp, codigo, recibo, codigo_esocial, evento
order by codi_emp, evento, codigo