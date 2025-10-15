SELECT cdempresa,
       idfuncionario,
       nrdiasemana,
       MAX(dtalteracao) as dtalteracao,
       hrentrada,
       hrsaidaalmoco,
       hrvoltaalmoco,
       hrsaida
  FROM wdp.hrcomp
  group by cdempresa,
       idfuncionario,
       nrdiasemana,
       hrentrada,
       hrsaidaalmoco,
       hrvoltaalmoco,
       hrsaida
 ORDER BY 1, 2