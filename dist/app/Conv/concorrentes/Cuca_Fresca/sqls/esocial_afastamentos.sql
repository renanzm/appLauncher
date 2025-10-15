select afast.codigoempresa,
       afast.codigoempregado,
       afast.dataafastamento,
       afast.dataalta,
       eso.recibo,
       eso.descricao like 'AFASTAMENTO%' as afastamento,
       eso.descricao like 'RETORNO%' as retorno
  from dpcuca.cargasesocial as eso
  inner join dpcuca.afasttrb as afast
    on afast.codigoempresa = eso.id_primario
   and afast.id_afasttrb = eso.id_secundario
 where eso.recibo <> ''
   and eso.id_tipos_arquivos_esocial = 29
   and (eso.descricao like 'AFASTAMENTO%' or eso.descricao like 'RETORNO%')
   and eso.excluido = 0
 order by 1, 2, 4;