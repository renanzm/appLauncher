SELECT depto.*,
	   ent_edu.nome AS nome_entidade_educativa,
	   ent_edu.cnpj AS cnpj_entidade_educativa,
	   his.dtinicial AS data_inicio,
	   custo.idcentrodecusto,
	   fpas.alterceiros,
	   fpas.alempresas,
	   fpas.alautonomos,
	   fpas.cdfpas,
	   lotacao.codigo AS codigo_esocial
FROM wdp.depto depto
LEFT JOIN wcont.ccusto custo
	ON COALESCE(depto.cdcentrodecusto::TEXT, '') = COALESCE(custo.cdchamada::TEXT, '')
LEFT JOIN wdp.empdphistorico his
	ON LPAD(depto.idempresa::text, 5, '0') = LPAD(his.idempresa::text, 5, '0')
	AND depto.iddepartamento = his.iddepartamento
	AND his.dtinicial = (SELECT MAX(dtinicial)
                         FROM wdp.empdphistorico his2
                         WHERE LPAD(his.idempresa::text, 5, '0') = LPAD(depto.idempresa::text, 5, '0')
							AND his2.iddepartamento = depto.iddepartamento)
LEFT JOIN wdp.entidade_educativa AS ent_edu
	ON LPAD(depto.idempresa::text, 5, '0') = LPAD(ent_edu.empresa_id::text, 5, '0')
	AND depto.iddepartamento = ent_edu.departamento_id
LEFT JOIN wdp.fpas AS fpas
	ON depto.idfpasgrps = fpas.idfpas
LEFT JOIN wdp.lotacao_tributaria as lotacao
	ON his.lotacao_tributaria_id = lotacao.id
ORDER BY 1, 2, 3