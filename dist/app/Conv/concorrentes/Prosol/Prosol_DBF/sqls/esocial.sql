SELECT codigo_empresa,
       codigo_colaborador as codigo_registro,
	   tipo_registro,
	   recibo,
	   chave,
	   data_apuracao
FROM public.tap_arquivos_cab
WHERE tipo_registro IN ('S-1000', 'S-1030', 'S-2200', 'S-2206', 'S-2300')
  AND TRIM(recibo) <> ''
  AND codigo_retorno = '201'
ORDER BY 1, 2, 3