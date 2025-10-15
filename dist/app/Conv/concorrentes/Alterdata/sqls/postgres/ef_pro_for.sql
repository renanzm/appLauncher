SELECT pf.id,
       pf.empresa_id,
       pf.produto_codigo,
       f.cdfornecedor,
       pf.fornecedor_produto_codigo
FROM wfiscal.produto_fornecedor pf
LEFT OUTER join wfiscal.fornec f
	ON cast(substring(regexp_replace(f.cdfornecedor, '[^0-9]', '', 'g'), 0, 9)  as int8) = pf.fornecedor_cnpj
WHERE pf.empresa_id > 0
	AND pf.fornecedor_cnpj > 0
	AND regexp_replace(f.cdfornecedor, '[^0-9]', '', 'g') <> ''
ORDER BY 1, 2