select SOCIOS.*,
       VLRPROLABORE
  from SOCIOS
  join (select MIN(mesbase) as mesbase,
						   empcodigo,
					       soccodigo,
				           vlrprolabore
	      from sociosprolabore as sp
	     where mesbase = (select MIN(mesbase)
                            from sociosprolabore as sub
                           where sub.empcodigo = sp.empcodigo
                             and sub.soccodigo = sp.soccodigo)
	  group by empcodigo,
               soccodigo,
               vlrprolabore) d on SUBSTRING(SOCIOS.CODI from 1 for 3) = d.EMPCODIGO and SUBSTRING(SOCIOS.CODI from 5 for 7) = d.SOCCODIGO
  order by 1,2