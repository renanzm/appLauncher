SELECT pf.id,
       pf.empresa_id,
       pf.produto_codigo,
       sub.cdfornecedor,
       pf.fornecedor_produto_codigo
FROM wfiscal.produto_fornecedor pf
LEFT JOIN (
	SELECT cdfornecedor,
		   CAST(SUBSTRING(dbo.getNumericValue(f.cdfornecedor), 0, 9)  AS integer) AS cdfornecedor_formatado
	FROM wfiscal.fornec f) AS sub
ON sub.cdfornecedor_formatado = pf.fornecedor_cnpj
WHERE pf.empresa_id > 0
	AND pf.fornecedor_cnpj > 0
ORDER BY 1, 2