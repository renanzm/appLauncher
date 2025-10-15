SELECT *
FROM [tomador]
WHERE EXISTS (SELECT 1 
                FROM [funci]
			   WHERE [tomador].[id] = [funci].ID_Tomador)
ORDER BY 1,2