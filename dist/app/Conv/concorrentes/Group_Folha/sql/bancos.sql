SELECT GF_Banco."IdBanco",
       GF_Banco."NomeBanco",
       GF_Banco."NumeroBanco",
       GF_Banco."NumeroAgencia",
       GF_Banco."DVAgencia",
       GF_Banco."NomeAgencia",
       (SELECT MAX(GF_Cidade."Cidade")
        FROM dbo.GF_Cidade
        WHERE GF_Cidade."IdCidade" = GF_Banco."IdCidade") AS CIDADE,
       (SELECT MAX(GF_UF."Sigla")
        FROM dbo.GF_Cidade, GF_UF
        WHERE GF_Cidade."IdCidade" = GF_Banco."IdCidade"
        AND GF_Cidade."IdUF" = GF_UF."IdUF") AS ESTADO
FROM dbo.GF_Banco
