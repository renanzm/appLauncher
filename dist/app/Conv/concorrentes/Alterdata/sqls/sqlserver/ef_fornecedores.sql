SELECT distinct pf.empresa_id,
       f.*
FROM wfiscal.produto_fornecedor pf
LEFT OUTER join wfiscal.fornec f
	ON cast(substring(dbo.getNumericValue(f.cdfornecedor), 0, 9) as integer) = pf.fornecedor_cnpj
WHERE pf.empresa_id > 0
	AND pf.fornecedor_cnpj > 0
	AND dbo.getNumericValue(f.cdfornecedor) <> ''
ORDER BY 1, 2
