SELECT DISTINCT f.EMPRESA,
                v.VERBA,
                v.DESCRICAO,
                v.TIPOENTRADA,
                'NORMAL' AS TIPO
           FROM FUNCIONARIO f,
                VERBAS v
WHERE exists(SELECT 1
	   FROM LANCAMENTO
	  WHERE LANCAMENTO.EMPRESA = f.EMPRESA
	    AND LANCAMENTO.EMPREGADO = f.EMPREGADO
	    AND LANCAMENTO.VERBA = v.VERBA)
UNION ALL
SELECT DISTINCT f.EMPRESA,
                v.VERBA,
                v.DESCRICAO,
                v.TIPOENTRADA,
                'DSR' AS TIPO
           FROM FUNCIONARIO f,
                VERBAS v
          WHERE exists(SELECT 1
          			   FROM LANCAMENTO
          			  WHERE LANCAMENTO.EMPRESA = f.EMPRESA
          			    AND LANCAMENTO.EMPREGADO = f.EMPREGADO
          			    AND LANCAMENTO.VERBA = v.VERBA
          			    AND LANCAMENTO.VALORREFLEXO > 0)
      
       ORDER BY 1, 2, 3 desc
