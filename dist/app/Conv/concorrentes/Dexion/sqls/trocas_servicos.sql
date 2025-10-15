SELECT ptl.*
  FROM P_TRABALHADORES_LOT AS ptl
 WHERE exists (SELECT pl.LOTACAO 
                        FROM P_LOTACOES pl
                       WHERE pl.EMPRESA = ptl.EMPRESA
						 and ptl.LOTACAO = pl.LOTACAO)
ORDER BY 1, 2, 3