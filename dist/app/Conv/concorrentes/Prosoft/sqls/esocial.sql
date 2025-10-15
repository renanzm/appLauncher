SELECT (SELECT emp.emp_codigo
          FROM prosoft.dbo.esoc_empresa AS emp
		 WHERE emp.emp_id = esocial.evg_fk_empresa) codi_emp,
       (SELECT conf.evo_codigo
	      FROM prosoft.dbo.esoc_evento_configuracao AS conf
		 WHERE conf.evo_id = esocial.evg_fk_evento_configuracao) evento,
	   CONVERT(CHAR, esocial.evg_data_geracao, 103) data_geracao,
	   esocial.evg_numero_recibo,
	   esocial.evg_chave_identificacao,
	   esocial.evg_tag_id,
	   esocial.evg_comp_ativa,
	   esocial.evg_fk_operacao
FROM prosoft.dbo.esoc_evento_gerado AS esocial
WHERE esocial.evg_status = 9
  AND esocial.evg_numero_recibo != ''
  AND esocial.evg_tipo_ambiente = 1
  AND esocial.evg_fk_evento_configuracao IN (1,2,4,5,6,17,18,19,20,22,28,29)
ORDER BY 1, 2, 3
