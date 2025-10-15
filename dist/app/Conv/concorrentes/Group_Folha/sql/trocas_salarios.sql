SELECT T."IdGrupoEmpresa",
       T."IdFuncionario",
       T."DtAlteracao",
       T."SalarioBase",
       T."Salario",
       T."TipoMovimentacao"
FROM (
    SELECT GF_AlteraSalarial."IdGrupoEmpresa",
           GF_AlteraSalarial."IdFuncionario",
           GF_AlteraSalarial."DtAlteracao",
           GF_AlteraSalarial."SalarioBase",
           GF_AlteraSalarial."Salario",
           GF_AlteraSalarial."TipoMovimentacao",
           ROW_NUMBER() OVER (PARTITION BY GF_AlteraSalarial."IdGrupoEmpresa", GF_AlteraSalarial."IdFuncionario", GF_AlteraSalarial."DtAlteracao" ORDER BY GF_AlteraSalarial."Salario" DESC) AS rn
    FROM dbo.GF_AlteraSalarial
) T
WHERE T.rn = 1
ORDER BY T."IdGrupoEmpresa", T."IdFuncionario", T."DtAlteracao"