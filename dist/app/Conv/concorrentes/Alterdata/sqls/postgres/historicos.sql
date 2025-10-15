CREATE OR REPLACE FUNCTION tratar_erro_consulta()
RETURNS TABLE (
    idempresa TEXT,
    idhistoricopadrao TEXT,
    dshistoricopadrao TEXT
) AS $$
BEGIN
    RETURN QUERY
    SELECT lancamento.idempresa::TEXT,
           hist.idhistoricopadrao::TEXT,
           hist.dshistoricopadrao::TEXT
    FROM wcont.hist
    INNER JOIN wcont.lancamento
    ON hist.idhistoricopadrao = lancamento.idhistoricopadrao
    GROUP BY lancamento.idempresa, hist.idhistoricopadrao, hist.dshistoricopadrao
    ORDER BY 1;
EXCEPTION
    WHEN undefined_table THEN
        RETURN QUERY
        SELECT NULL::TEXT AS idempresa,
               NULL::TEXT AS idhistoricopadrao,
               NULL::TEXT AS dshistoricopadrao
        LIMIT 0;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM tratar_erro_consulta();