select historicoferias.*,
       c.PAPI AS abonoinicial,
       c.PAPF AS abonofinal,
       c.RECI AS recebimento
from historicoferias
 LEFT JOIN CALCULOFERIAS AS c
     ON iniaqui = c.PAQI 
    AND finaqui = c.PAQF 
	and inigoz = c.PGOI
	and CODIGO = c.CODI
order by 1,2