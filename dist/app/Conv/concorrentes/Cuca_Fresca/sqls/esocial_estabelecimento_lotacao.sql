select eso.id_primario,
       coalesce(setor.codsetor, 1) as codigo,
       '1005' as evento,
       case 
         when setor.codlotacao is null then TO_CHAR(eso.id_primario, 'FM00000') || '00100001'
         else setor.codlotacao
       end as codigo_esocial,
       eso.recibo,
       coalesce(setor.datainicio, (select min(sat.data_alteracao)
                                     from dpcuca.sat
                                    where eso.id_primario = sat.codigoempresa)) as datainicio
  from dpcuca.cargasesocial eso
  left join dpcuca.tbtpsetor setor
    on setor.id = id_secundario
 where recibo <> ''
   and eso.id_tipos_arquivos_esocial = 2
union all
select eso.id_primario,
       coalesce(setor.codsetor, 1) as codigo,
       '1020' as evento,
       (REGEXP_MATCHES(eso.descricao, 'Código Lotação:\s*(\d+)'))[1] as codigo_esocial,
       eso.recibo,
       coalesce(setor.datainicio, (select min(sat.data_alteracao)
                                     from dpcuca.sat
                                    where eso.id_primario = sat.codigoempresa)) as datainicio
  from dpcuca.cargasesocial eso
  left join dpcuca.tbtpsetor setor
    on setor.id = id_secundario
 where recibo <> ''
   and eso.id_tipos_arquivos_esocial = 4
 order by 1, 2, 5;