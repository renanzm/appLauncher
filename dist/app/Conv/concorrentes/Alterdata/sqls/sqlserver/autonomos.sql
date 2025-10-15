SELECT *, 
       CASE 
           WHEN YEAR(dtnascimento) <= YEAR(GETDATE()) THEN dtnascimento 
           ELSE NULL 
       END AS dt_nascimento
FROM wdp.cadauto
ORDER BY 1;