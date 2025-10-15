WITH endereco_max as (
  select id_ger_empresa,
         MAX(id) as id
    from public.ger_empresa_endereco
   group by id_ger_empresa
)
SELECT 
	empresa_folha.id as id_folha,
    ger_empresa.*,
    (SELECT MAX(numero) 
     FROM public.ger_empresa_telefone 
     WHERE ger_empresa_telefone.id_ger_empresa = ger_empresa.id) AS telefone,
    endereco.*,
	bairro.bairro,
	uf.sigla,
	localidade.nome,
    UPPER(titulo.nome) AS tipo_rua,
    responsavel.nome as resp_nome,
	responsavel.cpf as resp_cpf,
	responsavel.telefone as resp_telefone,
	responsavel.email as resp_email,
	responsavel.cargo as resp_cargo,
	responsavel.rg as resp_rg,
	responsavel.logradouro as resp_logradouro,
	responsavel.numero as resp_numero,
	responsavel.complemento as resp_complemento,
	responsavel.cep as resp_cep
FROM 
    public.ger_empresa
LEFT JOIN 
    endereco_max
    ON ger_empresa.id = endereco_max.id_ger_empresa
LEFT JOIN 
    public.ger_empresa_endereco AS endereco 
    ON endereco_max.id = endereco.id_ger_empresa
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
LEFT JOIN 
    public.ger_responsavel AS responsavel 
    ON ger_empresa.id_ger_responsavel = responsavel.id
LEFT JOIN 
    public.mfp_empresa AS empresa_folha 
    ON ger_empresa.id = empresa_folha.id_ger_empresa
ORDER BY 
    3;
