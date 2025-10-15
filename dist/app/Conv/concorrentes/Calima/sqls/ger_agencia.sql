SELECT ger_agencia.*,
bancos.codigo,
bancos.nome as nome_banco
FROM public.ger_agencia
LEFT JOIN PUBLIC.ger_banco_instituicao as bancos
on bancos.id = ger_agencia.id_ger_banco_instituicao