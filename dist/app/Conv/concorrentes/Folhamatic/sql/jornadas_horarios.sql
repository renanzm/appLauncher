SELECT '{empresa}' AS EMPRESA,
	   codigo AS i_jornada,
	   dia_hor AS dia_semana,
	   jor_cod AS i_horario,
	   situacao AS tipo_horario
FROM f{empresa}.horjor
ORDER BY 2, 3