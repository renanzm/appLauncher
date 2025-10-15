SELECT emp.codemp,
       CASE config_esocial.vigencia
         WHEN '01/2018' THEN 1
         WHEN '07/2018' THEN 2
         WHEN '01/2019' THEN 3
         ELSE NULL
       END AS faseamento
  FROM genfolha.configuracaoesocialemp emp
  LEFT OUTER JOIN genfolha.configuracaoesocial config_esocial
    ON config_esocial.codigo = emp.codigo
 ORDER BY codemp ASC