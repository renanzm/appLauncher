SELECT GF_Cargo."IdCargo",
       GF_Cargo."Cargo",
       (SELECT MAX(GF_CBO."CodigoGoverno")
        FROM dbo.GF_CBO
        WHERE GF_CBO."IdCBO" = GF_Cargo."IdCBO") AS CBO
FROM dbo.GF_Cargo
ORDER BY GF_Cargo."IdCargo"
