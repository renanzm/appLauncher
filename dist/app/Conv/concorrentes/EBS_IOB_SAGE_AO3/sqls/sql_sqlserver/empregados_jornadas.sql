select CD_EMPRESA,
       CD_FUNCIONARIO,
       CD_TABELA AS JORNADA,
	   DT_HORARIO AS DATA_TROCA
  from EBS_Cordilheira.DBO.funhorario
ORDER BY 1,2,4