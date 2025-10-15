SELECT DISTINCT f.EMPRESA,
                f.CARGO,
                c.DESCRICAO,
                c.CBO
           FROM FUNCIONARIO f
           LEFT JOIN CARGOS c
             ON c.CARGO = f.CARGO
          WHERE f.CARGO IS NOT NULL
          ORDER BY EMPRESA, CARGO;