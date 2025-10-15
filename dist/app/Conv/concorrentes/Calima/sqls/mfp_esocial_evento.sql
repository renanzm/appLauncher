SELECT mfp_empresa_esocial_protocolo.id_mfp_empresa,
id_entidade_relacionada,
tipo_evento,
nr_recibo,
REPLACE( encode(arquivo_xml, 'escape') , '	', '' ) as arquivo_xml,
mfp_trabalhador_cargo.id_mfp_trabalhador

FROM public.mfp_esocial_evento 

LEFT JOIN public.mfp_trabalhador_cargo
ON mfp_trabalhador_cargo.id = mfp_esocial_evento.id_entidade_relacionada

left join public.mfp_empresa_esocial_protocolo
on mfp_empresa_esocial_protocolo.id = mfp_esocial_evento.id_mfp_empresa_esocial_protocolo

where nr_recibo <> ''
and tipo_evento in ('EvtInfoEmpregador', 'EvtTabCargo', 'EvtAdmissao', 'EvtTabHorTur', 'EvtAltCadastral', 'EvtAltContratual', 'EvtTSVInicio')
and substring(nr_recibo,1,3) <> '1.2'
order by 1,2,3