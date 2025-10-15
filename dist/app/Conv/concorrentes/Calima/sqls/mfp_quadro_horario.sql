SELECT 
    mfp_quadro_horario.id_mfp_empresa,
    mfp_quadro_horario.id,
    mfp_quadro_horario.descricao,
    mfp_quadro_horario.codigo,
    horario_matutino.dia_semana AS dia_semana_matu,
    MAX(horario_matutino.hora_entrada) AS hora_entrada_matu,
    MAX(horario_matutino.hora_saida) AS hora_saida_matu,
    MAX(horario_vespertino.dia_semana) AS dia_semana_vesp,
    MAX(horario_vespertino.hora_entrada) AS hora_entrada_vesp,
    MAX(horario_vespertino.hora_saida) AS hora_saida_vesp
FROM 
    public.mfp_quadro_horario
LEFT JOIN 
    mfp_quadro_horario_dia AS horario_matutino
ON 
    horario_matutino.id_mfp_quadro_horario = mfp_quadro_horario.id
    AND horario_matutino.turno = 1
LEFT JOIN 
    mfp_quadro_horario_dia AS horario_vespertino
ON 
    horario_vespertino.id_mfp_quadro_horario = mfp_quadro_horario.id
    AND horario_vespertino.turno = 2
GROUP BY 
    mfp_quadro_horario.id_mfp_empresa,
	mfp_quadro_horario.id,
    mfp_quadro_horario.descricao,
    mfp_quadro_horario.codigo,
	dia_semana_matu
ORDER BY 
    mfp_quadro_horario.id_mfp_empresa, 
	mfp_quadro_horario.codigo,
	dia_semana_matu;
