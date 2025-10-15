SELECT '{empresa}' AS EMPRESA,
	   j.cod_jorn AS i_horario,
	   j.des_jorn AS nome,
	   j.jorn_ini AS data_ini,
	   j.inativo AS situacao,
	   j.hr_entr AS hora_entrada,
	   j.hr_saida AS hora_saida,
	   (SELECT max(i.tpinterv) FROM f{empresa}.cad_interv i WHERE j.cod_jorn = i.cod_jorn) AS TIPO_INTERVALO, 
	   j.dur_jorn AS duracao_jornada_minutos,
	   j.id_esocial AS codigo_esocial
FROM f{empresa}.cad_jorn j

ORDER BY 2