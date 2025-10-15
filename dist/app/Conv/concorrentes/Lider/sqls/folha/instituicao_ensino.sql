SELECT DISTINCT Tomadores.*
FROM [dbo].[Tomadores] Tomadores
INNER JOIN [dbo].[Funcion�rios] Funcion�rios
ON Tomadores.[C�digo da empresa] = Funcion�rios.[C�digo da empresa]
AND Tomadores.[C�digo do tomador] = Funcion�rios.[Est�gio ensino]
WHERE Funcion�rios.[Categoria para esocial] = 901
ORDER BY 2, 3