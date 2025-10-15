select *
from GERENCIAESOCIAL
where evento in('S1000','S1005','S1020','S1030','S2200','S2300','S2205','S2206','S2230')
  and LEFT(NUMERORECIBO,3) = '1.1'
  order by 2, 4
