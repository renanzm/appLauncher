SELECT *,
case when EXTRACT('Year' FROM dtnascimento) <= EXTRACT('Year' FROM CURRENT_DATE) then dtnascimento else null end as dt_nascimento
FROM wdp.cadauto
ORDER BY 1