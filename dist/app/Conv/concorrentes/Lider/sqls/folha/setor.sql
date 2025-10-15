SELECT DISTINCT [Código da empresa],
	   REPLACE([Setor temp],'.','') as cod_setor,
       LTRIM(RTRIM( [Descrição do setor temp] )) as descricao_setor
  FROM [Funcionários]
 where [Descrição do setor temp] <> ''
ORDER BY 1,3,2