SELECT
  e.*,
  s.NOME AS rleg,
  s.NCPF AS cpf_leg,
  s.ENDE AS end_leg,
  s.CIDA AS mun_leg,
  s.ESTA AS uf_leg,
  s.NCEP AS cep_leg,
  s.NUME AS num_leg,
  s.BAIR AS bair_leg
FROM
  EMPRESAS e
  LEFT JOIN SOCIOS s ON e.SOCIO = CAST(SUBSTRING(s.CODI FROM POSITION('-' IN s.CODI) + 1) AS integer)
                      AND e.CODI = CAST(SUBSTRING(s.CODI FROM 1 FOR POSITION('-' IN s.CODI) - 1) AS integer)
ORDER BY
  e.CODI;