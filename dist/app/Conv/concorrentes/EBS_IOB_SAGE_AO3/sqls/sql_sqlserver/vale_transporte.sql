SELECT CD_EMPRESA,
       CD_FUNCIONARIO,
	   CD_LINHA,
	   '01/'+REPLICATE('0', 2 - LEN(CAST(MES AS varchar(2)))) + RTRIM(CAST(MES AS varchar(2)))+'/'+CAST(ANO AS varchar(4)) COMPETENCIA,
	   QT_VALES
  FROM ebs_cordilheira.dbo.FornecimentoVT
  ORDER BY 1, 2, 4 DESC