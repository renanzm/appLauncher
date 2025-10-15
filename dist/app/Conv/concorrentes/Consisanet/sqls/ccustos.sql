SELECT DISTINCT e.CD_EMPRESA,
                e.CD_CENTRO,
                e.CD_NEGOCIO,
                cc.DS_CENTRO
           FROM EMPREGADO e
           LEFT JOIN CENTROCUSTO cc
             ON cc.CD_CENTRO = e.CD_CENTRO
            AND cc.CD_NEGOCIO = e.CD_NEGOCIO
          WHERE e.CD_CENTRO IS NOT NULL
          ORDER BY CD_EMPRESA, CD_CENTRO;