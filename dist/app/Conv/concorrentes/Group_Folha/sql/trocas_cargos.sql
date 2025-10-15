SELECT GF_AlteraCargo."IdGrupoEmpresa",
       GF_AlteraCargo."IdFuncionario",
       GF_AlteraCargo."DtAlteracao",
       GF_AlteraCargo."IdCargo"
FROM dbo.  GF_AlteraCargo
ORDER BY GF_AlteraCargo."IdGrupoEmpresa", GF_AlteraCargo."IdFuncionario", GF_AlteraCargo."DtAlteracao"
