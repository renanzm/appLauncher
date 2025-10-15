SELECT mfp_sindicato.*,
endereco.*,
bairro.bairro,
uf.sigla,
localidade.nome
FROM public.mfp_sindicato
LEFT JOIN 
    public.mfp_sindicato_endereco AS endereco 
    ON mfp_sindicato.id = endereco.id_mfp_sindicato
LEFT JOIN 
    public.ger_cep_titulo AS titulo 
    ON endereco.id_ger_cep_titulo = titulo.id
LEFT JOIN 
    public.ger_cep_bairro AS bairro 
    ON endereco.id_ger_cep_bairro = bairro.id
LEFT JOIN 
    public.ger_cep_localidade AS localidade 
    ON endereco.id_ger_cep_localidade = localidade.id
LEFT JOIN 
    public.ger_cep_uf AS uf 
    ON endereco.id_ger_cep_uf = uf.id