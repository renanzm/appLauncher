SELECT t.EMPRESA,
       t."DATA",
       e.CNPJ,
       e.CAEPF,
       e.TIPO_INSCRICAO,
       e.ENDERECO,
       e.NUMERO,
       e.COMPLEMENTO,
       e.BAIRRO,
       e.COD_MUN_IBGE,
       e.CEP,
       e.CNAE,
       e.CNAE1,
       e.FONE,
       t.FPAS,
       t.PERCEMPRESA,
       t.CODTERCEIROS,
       t.PERCTERCEIROS,
       t.PERC_FAP
  FROM TRIBUTACAO_FOLHA t
  LEFT JOIN EMPRESA e
    ON t.EMPRESA = e.EMPRESA
 WHERE t."DATA" = (SELECT MIN(t2."DATA") 
                     FROM TRIBUTACAO_FOLHA t2
                    WHERE t2.EMPRESA = t.EMPRESA)
    OR t."DATA" = (SELECT MAX(t2."DATA") 
                     FROM TRIBUTACAO_FOLHA t2
                    WHERE t2.EMPRESA = t.EMPRESA)
 ORDER BY EMPRESA, "DATA";