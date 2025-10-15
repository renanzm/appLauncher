SELECT DISTINCT [C�digo da empresa],
	   REPLACE([Setor temp],'.','') as cod_setor,
       LTRIM(RTRIM( [Descri��o do setor temp] )) as descricao_setor
  FROM [Funcion�rios]
 where [Descri��o do setor temp] <> ''
ORDER BY 1,3,2