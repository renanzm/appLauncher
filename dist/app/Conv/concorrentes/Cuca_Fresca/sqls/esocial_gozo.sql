select fer.codigoempresa,
       fer.codigoempregado,
       eso.recibo,
       TO_DATE((REGEXP_MATCHES(eso.descricao, 'Gozo:\s*(\d{2}/\d{2}/\d{4})'))[1], 'DD/MM/YYYY') AS data_gozo
  from dpcuca.cargasesocial as eso
 inner join dpcuca.ferias as fer
    on fer.id_ferias = eso.id_secundario
 where eso.recibo <> ''
   and eso.id_tipos_arquivos_esocial = 29
   and eso.descricao like 'FÉRIAS%'
   and eso.excluido = 0
 order by 1, 2, 4;