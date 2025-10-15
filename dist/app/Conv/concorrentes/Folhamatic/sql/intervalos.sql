SELECT '{empresa}' AS EMPRESA,
	   cod_jorn AS i_horario,
	   cod_inter AS i_intervalo,
	   iniinterv AS hora_inicio,
	   terminterv AS hora_fim,
	   tpinterv AS intervalo_principal
FROM f{empresa}.cad_interv
ORDER BY 2, 3