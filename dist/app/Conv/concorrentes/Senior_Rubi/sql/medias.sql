DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT ver.numemp,
       ver.numcad,
	   ver.tipcol,
	   comp.cmpref,
	   ver.codeve,
	   ver.refeve,
	   ver.valeve
  FROM ', @retorno, '.r046ver AS ver
       INNER JOIN ', @retorno, '.r350ipg AS comp
					ON comp.numemp = ver.numemp
				   and comp.codcal = ver.codcal
				   and (select max(f.numcad) 
				          from ', @retorno, '.R034FUN as f 
						 where f.numemp = comp.numemp
						   and f.numcpf = comp.cpftra) = ver.numcad
WHERE year(comp.cmpref) >= year(GETDATE()) -3
  and exists ( SELECT 1 
                 FROM ', @retorno, '.R008INC AS inc
                WHERE inc.codeve = ver.codeve
			      and inc.codtab = ver.tabeve
				  and inc.conmed = ''S'') /* Filtra lançamentos apenas quando o evento tem incidencia de médias */
ORDER BY 1,2,3,4,5')
exec(@query)