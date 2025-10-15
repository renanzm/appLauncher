WITH cte_dependentes AS (
    SELECT 
        d.iddependente,
        d.idcolaborador,
        d.fldependente,
        d.nmdependente,
        d.dtnascimento,
        d.nrcpf,
        d.fldependenteirrf,
        d.fldependentesf,
        d.flplanosaude,
        d.flincapaztrabalho,
        d.nmcidadenascimento,
        d.nmcartorio,
        d.nrregistro,
        d.nrlivro,
        d.nrfolha,
        d.flsexo,
        d.dtinicio,
        ROW_NUMBER() OVER (
            PARTITION BY d.idcolaborador, d.nmdependente, d.dtnascimento
            ORDER BY d.dtinicio DESC
        ) AS rn
    FROM dbo.tbdependente d	
)
SELECT *
FROM cte_dependentes
WHERE rn = 1
ORDER BY iddependente, idcolaborador
