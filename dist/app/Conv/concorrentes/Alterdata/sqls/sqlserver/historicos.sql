IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'wcont' AND TABLE_NAME = 'hist')
BEGIN
    SELECT lancamento.idempresa,
                 hist.idhistoricopadrao,
                 hist.dshistoricopadrao
        FROM wcont.hist
        INNER JOIN wcont.lancamento
        ON hist.idhistoricopadrao = lancamento.idhistoricopadrao
        GROUP BY lancamento.idempresa, hist.idhistoricopadrao, hist.dshistoricopadrao
        ORDER BY lancamento.idempresa;
END
ELSE
BEGIN
    SELECT '' AS idempresa, 
		   '' AS idhistoricopadrao,
	       '' AS dshistoricopadrao
END