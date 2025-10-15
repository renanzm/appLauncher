DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT distinct rub.numemp,
       rub.codeve,
	   rub.desrub,
	   evc.tipinf,
	   inc.conmed
  FROM ' , @retorno, '.r008rub as rub 
  LEFT OUTER JOIN ' , @retorno, '.R030EMP AS emp
               ON rub.numemp = emp.numemp
			  and rub.tabeve = emp.tabeve
  LEFT OUTER JOIN ' , @retorno, '.R008EVC AS evc
               ON evc.codeve = rub.codeve
			  and evc.codtab = rub.tabeve
  LEFT OUTER JOIN ' , @retorno, '.R008INC AS inc
               ON inc.codeve = rub.codeve
			  and inc.codtab = rub.tabeve
WHERE rub.codeve <> 0 
  and inc.conmed = ''S'' /* Quando campo "ConMed" é "Considera para média" for "Sim" */
ORDER BY 1,2,3')
exec(@query)


