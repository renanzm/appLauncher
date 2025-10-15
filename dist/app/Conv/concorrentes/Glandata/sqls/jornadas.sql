SELECT (select max(emp.empresa) from empresas as emp where emp.idempregador = horariosjornadas.idempregador) as empresa,
       horariosjornadas.jornada,
       horariosjornadas.descricao,
       horariosjornadas.tipojornada,
       horariosjornadas.descricaotipojornada
  FROM horariosjornadas
ORDER BY 1,2