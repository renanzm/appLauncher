WITH CTE_RubricaAtual AS (
    SELECT *
    FROM (
        SELECT 
            rd.*,
            ROW_NUMBER() OVER (PARTITION BY rd.idempresa, rd.idrubrica ORDER BY rd.dtinicio DESC) AS rn
        FROM dbo.tbrubricadetalhe rd
    ) AS sub
    WHERE sub.rn = 1
),
CTE_ExisteMedia AS (
    SELECT DISTINCT 
        idempresa,
        idrubricamedia
    FROM dbo.tbcontrachequemedia
)

SELECT 
    r.idempresa,
    r.idrubrica,
    r.dsrubrica,
    rb.idnaturezarubrica
FROM CTE_RubricaAtual r
INNER JOIN dbo.tbrubrica rb
    ON rb.idempresa = r.idempresa
   AND rb.idrubrica = r.idrubrica
INNER JOIN CTE_ExisteMedia cm
    ON cm.idempresa = r.idempresa
   AND cm.idrubricamedia = r.idrubrica
ORDER BY r.idempresa, r.idrubrica;
