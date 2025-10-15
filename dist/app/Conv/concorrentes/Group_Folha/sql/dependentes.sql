SELECT GF_Dependente."IdGrupoEmpresa",
       GF_Dependente."IdFuncionario",
       GF_Dependente."IdDependente",
       GF_Dependente."Nome",
       GF_Dependente."DtNascimento",
       GF_Dependente."IdGrauParentesco",
       (SELECT MAX(GF_Cidade."Cidade")
        FROM dbo.GF_Cidade
        WHERE GF_Cidade."IdCidade" = GF_Dependente."IdNaturalidade") AS CIDADE,
       (SELECT MAX(GF_UF."Sigla")
        FROM dbo.GF_Cidade, GF_UF
        WHERE GF_Cidade."IdCidade" = GF_Dependente."IdNaturalidade"
        AND GF_Cidade."IdUF" = GF_UF."IdUF") AS ESTADO,
       GF_Dependente."Cartorio",
       GF_Dependente."NroRegistro",
       GF_Dependente."NroLivro",
       GF_Dependente."NroFolha",
       GF_Dependente."DtEntregaCertidao",
       GF_Dependente."DtFimDepIRRF",
       GF_Dependente."DtFimDepSF",
       GF_Dependente."CPF"
FROM dbo.GF_Dependente
WHERE DtInicioVigencia = (SELECT MAX(DtInicioVigencia) 
                            FROM GF_Dependente as SUB
						   WHERE SUB.IdFuncionario = GF_Dependente.IdFuncionario)
ORDER BY GF_Dependente."IdGrupoEmpresa", GF_Dependente."IdFuncionario", GF_Dependente."IdDependente"