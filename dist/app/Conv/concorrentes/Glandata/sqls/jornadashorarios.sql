SELECT (select max(emp.empresa) from empresas as emp where emp.idempregador = horariosjornadasdetalhes.idempregador) as empresa,
       horariosjornadasdetalhes.jornada,
       horariosjornadasdetalhes.sequencial,
       horariosjornadasdetalhes.horario,
       horariosjornadasdetalhes.dia
  FROM horariosjornadasdetalhes
order by 1,2,3,4,5