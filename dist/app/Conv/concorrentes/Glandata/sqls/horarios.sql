SELECT (select max(emp.empresa) from empresas as emp where emp.idempregador = horariosesocial.idempregador) as empresa,
       horariosesocial.horario,
       horariosesocial.descricao,
       horariosesocial.entrada,
       horariosesocial.saida,
       horariosesocial.duracao,
       horariosesocial.codigoesocial,
       horariosintervalosesocial.iniciointervalo,
       horariosintervalosesocial.fimintervalo,
       horariosintervalosesocial.duracaointervalo
  FROM horariosesocial left outer join horariosintervalosesocial
    on horariosesocial.idempregador = horariosintervalosesocial.idempregador
   and horariosesocial.horario = horariosintervalosesocial.horario
ORDER BY 1,2