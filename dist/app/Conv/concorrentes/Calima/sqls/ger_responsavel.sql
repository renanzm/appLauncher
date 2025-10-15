SELECT ger_responsavel.*,
bairro.bairro as bairro_socio,
uf.sigla as sigla_socio,
localidade.nome as nome_cidade
FROM public.ger_responsavel
LEFT JOIN 
    public.ger_cep_bairro AS bairro 
    ON ger_responsavel.id_ger_cep_bairro = bairro.id
LEFT JOIN 
    public.ger_cep_localidade AS localidade 
    ON ger_responsavel.id_ger_cep_localidade = localidade.id
LEFT JOIN 
    public.ger_cep_uf AS uf 
    ON ger_responsavel.id_ger_cep_uf = uf.id