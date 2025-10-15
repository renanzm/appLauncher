SELECT idfuncionario,
       idevento,
	   coalesce (dissidio_competencia, dtinicial) as dtinicial,
	   tpprocesso,
	   vlevento,
	   qtevento
FROM wdp.r{codi_emp} AS lanc
WHERE EXTRACT('Year' FROM dtinicial) >= (EXTRACT('Year' FROM CURRENT_DATE) -3)
ORDER BY 3, 1