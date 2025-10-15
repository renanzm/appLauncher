SELECT f.*,
       (SELECT MAX(r.CD_SETOR)
	               FROM RHSALARIO r
				  WHERE r.CD_EMPRESA = f.CD_EMPRESA
				    AND r.CD_FUNCIONARIO = f.CD_FUNCIONARIO
				    AND r.CD_SETOR <> 0
					AND CAST('01/'||lpad(cast(r.MES as varchar(2)), 2, '0')||'/'||cast(r.ANO as varchar(4)) AS DATE) = (SELECT MAX(CAST('01/'||lpad(cast(r2.MES as varchar(2)), 2, '0')||'/'||cast(r2.ANO as varchar(4)) AS DATE)) 
                                                                                                                          FROM RHSALARIO r2 
                                                                                                                         WHERE r2.CD_EMPRESA = f.CD_EMPRESA 
                                                                                                                           AND r2.CD_SETOR <> 0
                                                                                                                           AND r2.CD_FUNCIONARIO = f.CD_FUNCIONARIO)) CD_SETOR
  FROM RHFUNCIONARIO f
ORDER BY 1, 2