SELECT DISTINCT Tomadores.*
FROM [dbo].[Tomadores] Tomadores
INNER JOIN [dbo].[Funcionários] Funcionários
ON Tomadores.[Código da empresa] = Funcionários.[Código da empresa]
AND Tomadores.[Código do tomador] = Funcionários.[Estágio ensino]
WHERE Funcionários.[Categoria para esocial] = 901
ORDER BY 2, 3