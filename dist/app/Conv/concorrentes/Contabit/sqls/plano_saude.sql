WITH CTE_DataInicio AS (
    SELECT 
        idtrabalhador,
        idempresa,
        MIN(dtmvto) AS data_inicio
    FROM dbo.tbmvtoplanosaude
    GROUP BY idtrabalhador, idempresa
)

SELECT 
    tbtrabplanosaude.*,
    cte.data_inicio
FROM dbo.tbtrabplanosaude
LEFT JOIN CTE_DataInicio cte
    ON cte.idtrabalhador = tbtrabplanosaude.idtrabalhador
   AND cte.idempresa = tbtrabplanosaude.idempresa
order by idempresa, idtrabalhador, fltipo desc
