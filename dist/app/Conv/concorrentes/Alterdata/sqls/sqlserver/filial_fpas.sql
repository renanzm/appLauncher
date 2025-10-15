select idempresa, dtinicial, alfapgps
  from wdp.empdphistorico
 where iddepartamento is null
 order by 1, 2;