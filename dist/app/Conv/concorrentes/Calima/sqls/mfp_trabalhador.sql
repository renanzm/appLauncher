WITH TrabalhadorRecente AS (
    SELECT mfp_trabalhador.*,
       mfp_trabalhador_cargo.dt_admissao,
       mfp_trabalhador_cargo.categoria,
	   mfp_trabalhador_cargo.matricula_esocial,
       -- Subconsultas para obter apenas um registro de cada campo de endereço
       (SELECT logradouro 
        FROM public.mfp_trabalhador_endereco AS endereco
        WHERE endereco.id_mfp_trabalhador = mfp_trabalhador.id
        LIMIT 1) AS logradouro,
       (SELECT numero 
        FROM public.mfp_trabalhador_endereco AS endereco
        WHERE endereco.id_mfp_trabalhador = mfp_trabalhador.id
        LIMIT 1) AS numero,
       (SELECT complemento 
        FROM public.mfp_trabalhador_endereco AS endereco
        WHERE endereco.id_mfp_trabalhador = mfp_trabalhador.id
        LIMIT 1) AS complemento,
       (SELECT cep 
        FROM public.mfp_trabalhador_endereco AS endereco
        WHERE endereco.id_mfp_trabalhador = mfp_trabalhador.id
        LIMIT 1) AS cep,
       (SELECT id_ger_cep_titulo 
        FROM public.mfp_trabalhador_endereco AS endereco
        WHERE endereco.id_mfp_trabalhador = mfp_trabalhador.id
        LIMIT 1) AS id_ger_cep_titulo,
       -- Subconsultas para obter os valores de bairro, cidade, e UF
       (SELECT bairro.bairro 
        FROM public.ger_cep_bairro AS bairro
        JOIN public.mfp_trabalhador_endereco AS endereco ON endereco.id_ger_cep_bairro = bairro.id
        WHERE endereco.id_mfp_trabalhador = mfp_trabalhador.id
        LIMIT 1) AS bairro,
       (SELECT localidade.nome 
        FROM public.ger_cep_localidade AS localidade
        JOIN public.mfp_trabalhador_endereco AS endereco ON endereco.id_ger_cep_localidade = localidade.id
        WHERE endereco.id_mfp_trabalhador = mfp_trabalhador.id
        LIMIT 1) AS nome_cidade,
       (SELECT uf.sigla 
        FROM public.ger_cep_uf AS uf
        JOIN public.mfp_trabalhador_endereco AS endereco ON endereco.id_ger_cep_uf = uf.id
        WHERE endereco.id_mfp_trabalhador = mfp_trabalhador.id
        LIMIT 1) AS sigla,
       -- Mantendo as outras colunas da consulta original
       (SELECT max(matricula)
        FROM public.mfp_trabalhador_cargo
        WHERE mfp_trabalhador_cargo.id_mfp_trabalhador = mfp_trabalhador.id) AS matricula,
       (SELECT max(tqhorario.id_mfp_quadro_horario)
        FROM public.mfp_trabalhador_cargo_quadro_horario AS tqhorario
        JOIN public.mfp_trabalhador_cargo AS tcargo
          ON tqhorario.id_mfp_trabalhador_cargo = tcargo.id
        WHERE tcargo.id_mfp_trabalhador = mfp_trabalhador.id
          AND tcargo.id_mfp_empresa = mfp_trabalhador.id_mfp_empresa) AS Jornada,
       (SELECT max(t1.numero)
        FROM public.mfp_trabalhador_telefone AS t1
        WHERE t1.id_mfp_trabalhador = mfp_trabalhador.id
          AND tipo_celular = false) AS telefone, 
       (SELECT max(t1.numero)
        FROM public.mfp_trabalhador_telefone AS t1
        WHERE t1.id_mfp_trabalhador = mfp_trabalhador.id
          AND tipo_celular = true) AS celular,
       ger_centro_custo.codigo AS codigo_ccusto,
       ger_centro_custo.descricao,
       mfp_sindicato.codigo AS codigo_sindicato,
       (SELECT tipo_pagamento
        FROM public.mfp_trabalhador_cargo_salario AS salario
        WHERE salario.id_mfp_trabalhador_cargo = mfp_trabalhador_cargo.id
        ORDER BY salario.id ASC
        LIMIT 1) AS tipo_pagamento,
       (SELECT id_mfp_cargo
        FROM public.mfp_vinculo_trabalhador AS vinculo
        WHERE vinculo.id_mfp_trabalhador_cargo = mfp_trabalhador_cargo.id
          AND vinculo.nro_ordem = 1
        ORDER BY id_mfp_trabalhador_cargo, nro_ordem
        LIMIT 1) AS codigo_cargo,
       (SELECT id_mfp_tomador_servico
        FROM public.mfp_trabalhador_cargo_tomador_servico AS servico
        WHERE servico.id_mfp_trabalhador_cargo = mfp_trabalhador_cargo.id
        ORDER BY id_mfp_trabalhador_cargo
        LIMIT 1) AS codigo_servico,
		ger_cep_uf.sigla as uf_cart_prof,
		(SELECT nome
        FROM public.ger_cep_localidade AS local_nascimento
        WHERE local_nascimento.id = mfp_trabalhador.id_ger_cep_localidade_naturalidade
        ORDER BY 1) AS local_nascimento,
		(SELECT sigla
        FROM public.ger_cep_uf AS uf_nascimento
        WHERE uf_nascimento.id = mfp_trabalhador.id_ger_cep_uf_naturalidade
        ORDER BY 1) AS uf_nascimento,
		(SELECT sigla
        FROM public.ger_cep_uf AS uf_exp_ident
        WHERE uf_exp_ident.id = mfp_trabalhador.id_ger_cep_uf_identidade
        ORDER BY 1) AS uf_exp_ident,
		(SELECT sigla
        FROM public.ger_cep_uf AS CODIGO_UF_CARTEIRA_MOTORISTA
        WHERE CODIGO_UF_CARTEIRA_MOTORISTA.id = mfp_trabalhador.id_ger_cep_uf_cnh
        ORDER BY 1) AS CODIGO_UF_CARTEIRA_MOTORISTA,
           -- ROW_NUMBER para priorizar a data mais recente
           ROW_NUMBER() OVER(PARTITION BY mfp_trabalhador.id, mfp_trabalhador.codigo 
                             ORDER BY mfp_trabalhador_cargo.dt_admissao DESC) AS rn
    FROM public.mfp_trabalhador
    LEFT JOIN public.mfp_trabalhador_cargo
      ON mfp_trabalhador_cargo.id_mfp_trabalhador = mfp_trabalhador.id
    LEFT JOIN public.ger_centro_custo
      ON ger_centro_custo.id = mfp_trabalhador_cargo.id_ger_centro_custo
    LEFT JOIN public.mfp_sindicato
      ON mfp_sindicato.id = mfp_trabalhador_cargo.id_mfp_sindicato
    LEFT JOIN public.ger_cep_uf
      ON ger_cep_uf.id = mfp_trabalhador.id_ger_cep_uf_carteira_trabalho
)
SELECT *
FROM TrabalhadorRecente
WHERE rn = 1
ORDER BY id_mfp_empresa, codigo, dt_admissao;
