SELECT GF_Departamento."IdGrupoEmpresa",
       GF_Departamento."IdDepartamento",
       GF_Departamento."Departamento"
FROM dbo.GF_Departamento
ORDER BY GF_Departamento."IdGrupoEmpresa", GF_Departamento."IdDepartamento"
