SELECT DISTINCT [C�digo da empresa],
	   [C�digo do tomador] as codigo_tomador,
       [Nome do tomador] as descricao_tomador
  FROM [Tomadores]
 where [Nome do tomador] <> ''
ORDER BY 1,2,3