SELECT GF_Sindicato."IdSindicato",
       GF_Sindicato."Sindicato",
       GF_Sindicato."Abreviacao",
       GF_Sindicato."TipoInscricao",
       GF_Sindicato."Inscricao",
       GF_Sindicato."Logradouro",
       GF_Sindicato."Numero",
       GF_Sindicato."Complemento",
       GF_Sindicato."Bairro",
       (SELECT MAX(GF_Cidade."Cidade")
        FROM dbo.GF_Cidade
        WHERE GF_Cidade."IdCidade" = GF_Sindicato."IdCidade") AS CIDADE,
       (SELECT MAX(GF_UF."Sigla")
        FROM dbo.GF_Cidade, GF_UF
        WHERE GF_Cidade."IdCidade" = GF_Sindicato."IdCidade"
        AND GF_Cidade."IdUF" = GF_UF."IdUF") AS UF,
       GF_Sindicato."CEP",
       GF_Sindicato."DDDTelefone",
       GF_Sindicato."Telefone",
       GF_Sindicato."DDDFax",
       GF_Sindicato."Fax",
       GF_Sindicato."Email",
       GF_Sindicato."CodigoEntidade",
       GF_Sindicato."MesDtBase",
       GF_Sindicato."MesContribuicao"
FROM dbo.GF_Sindicato
