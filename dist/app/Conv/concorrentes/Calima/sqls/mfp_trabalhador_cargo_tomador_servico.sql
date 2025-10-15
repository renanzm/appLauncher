SELECT
    MAX(mfp_trabalhador_cargo_tomador_servico.id) AS id,
    MAX(mfp_trabalhador_cargo_tomador_servico.dt_inicio) AS dt_inicio,
    mfp_trabalhador_cargo_tomador_servico.id_mfp_trabalhador_cargo,
    MAX(mfp_trabalhador_cargo_tomador_servico.id_mfp_tomador_servico) AS id_mfp_tomador_servico,
    max(mfp_tomador_servico.id) as id_servico,
    max(mfp_tomador_servico.codigo) as codigo,
	max(mfp_tomador_servico.nome) as nome,
	max(mfp_tomador_servico.cnpj) as cnpj,
	max(mfp_tomador_servico.cei) as cei,
	max(mfp_tomador_servico.sefip_codigo_recolhimento) as codigo_sefip,
	max(endereco.logradouro) as logradouro,
	max(endereco.numero) as numero,
	max(endereco.complemento) as complemento,
	max(endereco.cep) as cep,
	max(mfp_fpas.codigo) as codigo_fpas,
	max(mfp_gps.codigo) as codigo_gps,
	mfp_trabalhador_cargo.id_mfp_trabalhador,
	bairro.bairro,
	localidade.nome,
    UPPER(titulo.nome) AS tipo_rua
FROM
    mfp_trabalhador_cargo_tomador_servico
LEFT JOIN public.mfp_trabalhador_cargo
	ON public.mfp_trabalhador_cargo_tomador_servico.id_mfp_trabalhador_cargo = mfp_trabalhador_cargo.id
left JOIN
    mfp_tomador_servico ON mfp_tomador_servico.id = mfp_trabalhador_cargo_tomador_servico.id_mfp_tomador_servico
left JOIN
	mfp_tomador_servico_endereco as endereco on endereco.id_mfp_tomador_servico = mfp_trabalhador_cargo_tomador_servico.id_mfp_tomador_servico
LEFT JOIN 
    public.ger_cep_titulo AS titulo 
    ON endereco.id_ger_cep_titulo = titulo.id
LEFT JOIN 
    public.ger_cep_bairro AS bairro 
    ON endereco.id_ger_cep_bairro = bairro.id
LEFT JOIN 
    public.ger_cep_localidade AS localidade 
    ON endereco.id_ger_cep_localidade = localidade.id
left JOIN
	mfp_fpas on mfp_fpas.id = mfp_tomador_servico.id_mfp_fpas
left JOIN
	mfp_gps on mfp_gps.id = mfp_tomador_servico.id_mfp_gps
GROUP BY
    mfp_trabalhador_cargo_tomador_servico.id_mfp_trabalhador_cargo,mfp_trabalhador_cargo.id_mfp_trabalhador,bairro.bairro,
	localidade.nome,
    UPPER(titulo.nome)
ORDER BY
    3, 2;