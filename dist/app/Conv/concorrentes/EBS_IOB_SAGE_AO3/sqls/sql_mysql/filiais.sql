SELECT CRDESTABELECIMENTO.CD_EMPRESA,
       CRDESTABELECIMENTO.CD_ESTABELECIMENTO,
       RAZAO,
       ENDERECO,
       NUMERO,
       COMPLEMENTO,
       BAIRRO,
       CIDADE,
       CEP,
       UF,       
       DDD_TELEFONE,
       TELEFONE,
       DDD_FAX,
       FAX,
       CNPJ_CPF,
       INSCRICAO_EST,
       INSCRICAO_MUN,
       CODIGO_CEI,
       CNAE,
       CRDEstabelecimentoVigencia.DT_INICIO_VIGENCIA,
       CRDEstabelecimentoVigencia.PERC_FILANTROPIA,
       CRDEstabelecimentoVigencia.CD_FPAS as CODIGO_FPAS,
       CRDEstabelecimentoVigencia.ALIQ_FPAS,
       CRDEstabelecimentoVigencia.ALIQ_FPAS_PROLABORE,
       '' AS ALIQ_SAT,
       CRDEstabelecimentoVigencia.CD_TERCEIROS as CODIGO_TERCEIROS,
       CRDEstabelecimentoVigencia.ALIQ_TERCEIROS,
       (SELECT MAX(CRDEstabelecimentoparametro.ID_ESOCIAL) FROM CRDEstabelecimentoparametro WHERE CRDEstabelecimentoparametro.cd_empresa = CRDEstabelecimento.cd_empresa AND CRDEstabelecimentoparametro.CD_ESTABELECIMENTO = CRDEstabelecimento.CD_ESTABELECIMENTO) AS ID_ESOCIAL,
       CRDEstabelecimentoVigencia.ESOCIAL_CNO_OBRA as CNO,
       CRDESTABELECIMENTOVIGENCIA.ESOCIAL_CAEPF as CAEPF,
		COALESCE((SELECT MUNICIPIOG.CD_MUNICIPIO_CONCLA 
	               FROM MUNICIPIOG 
				  WHERE MUNICIPIOG.CD_MUNICIPIO = CRDESTABELECIMENTO.CD_MUNICIPIO  
				    AND MUNICIPIOG.ESTADO = CRDESTABELECIMENTO.UF
					AND MUNICIPIOG.CD_MUNICIPIO_CONCLA <> 0), COALESCE((SELECT MUNICIPIOCGW.CD_MUNICIPIO_IBGE 
																	   FROM MUNICIPIOCGW 
																	  WHERE MUNICIPIOCGW.CD_MUNICIPIO_IBGE = CRDESTABELECIMENTO.CD_MUNICIPIO  
																		AND MUNICIPIOCGW.UF = CRDESTABELECIMENTO.UF),(SELECT MUNICIPIOCGW.CD_MUNICIPIO_IBGE 
																													    FROM MUNICIPIOCGW 
																													   WHERE MUNICIPIOCGW.DESCRICAO = CRDESTABELECIMENTO.CIDADE  
																												 		 AND MUNICIPIOCGW.UF = CRDESTABELECIMENTO.UF))) AS CODIGO_IBGE,
(SELECT MAX(CRDEstabelecimentoParametro.tipo_logradouro) FROM CRDEstabelecimentoParametro WHERE CRDEstabelecimentoparametro.cd_empresa = CRDEstabelecimento.cd_empresa AND CRDEstabelecimentoparametro.CD_ESTABELECIMENTO = CRDEstabelecimento.CD_ESTABELECIMENTO) AS TIPO_LOGRADOURO,
CRDESTABELECIMENTOVIGENCIA.ALIQ_FAP																											
	   
FROM CRDESTABELECIMENTO
JOIN crdestabelecimentovigencia
ON CRDESTABELECIMENTO.cd_empresa = crdestabelecimentovigencia.cd_empresa
AND CRDESTABELECIMENTO.cd_estabelecimento = crdestabelecimentovigencia.cd_estabelecimento
ORDER BY CD_EMPRESA, CD_ESTABELECIMENTO