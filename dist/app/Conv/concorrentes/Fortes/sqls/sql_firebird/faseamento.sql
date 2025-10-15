SELECT DISTINCT efa.EMP_CODIGO,
                ef.GRUPO
           FROM ES_FASE_ADESAO efa
           LEFT JOIN ES_FASE ef
             ON ef.ID = efa.ID_FASE
		  WHERE ef.AMBIENTE = 1;