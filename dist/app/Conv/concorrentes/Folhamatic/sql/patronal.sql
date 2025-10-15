SELECT '{empresa}' AS EMPRESA,*
FROM f{empresa}.patronal
where (SELECT count(*) FROM genfolha.sindic as s where s.CODSIND = CODSIND2) > 0
order by 1