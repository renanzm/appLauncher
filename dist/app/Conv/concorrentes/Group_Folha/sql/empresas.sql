SELECT GF_Empresa."IdEmpresa",
       GF_Empresa."IdGrupoEmpresa",
       GF_Empresa."RazaoSocial",
       GF_Empresa."NomeFantasia",
       GF_Empresa."TipoInscricao",
       GF_Empresa."Inscricao",
       GF_Empresa."InscricaoEstadual",
       GF_Empresa."Logradouro",
       GF_Empresa."Numero",
       GF_Empresa."Complemento",
       GF_Empresa."Bairro",
       (SELECT MAX(GF_Cidade."Cidade")
        FROM dbo.GF_Cidade
        WHERE GF_Cidade."IdCidade" = GF_Empresa."IdCidade") AS CIDADE,
       (SELECT MAX(GF_UF."Sigla")
        FROM dbo.GF_Cidade, dbo.GF_UF
        WHERE GF_Cidade."IdCidade" = GF_Empresa."IdCidade"
        AND GF_Cidade."IdUF" = GF_UF."IdUF") AS ESTADO,
       GF_Empresa."CEP",
       GF_Empresa."DDDTelefone",
       GF_Empresa."Telefone",
       GF_Empresa."DDDFax",
       GF_Empresa."Fax",
       GF_Empresa."Email",
       GF_Empresa."Responsavel",
       GF_Empresa."CPFResponsavel",
       GF_Empresa."CargoResponsavel",
       GF_Empresa."ResponsavelCNPJ",
       GF_Empresa."CPFResponsavelCNPJ"
FROM dbo.GF_Empresa
ORDER BY dbo.GF_Empresa."IdEmpresa"
