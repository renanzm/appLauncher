SELECT codigo_empresa,
       codigo_colaborador,
	   tipo_registro,
	   recibo
	   
  FROM public.tap_arquivos_cab
  
where tipo_registro in ('S-1000','S-1005','S-1020','S-1030','S-1050','S-2200','S-2300','S-2306') 
  and trim(recibo) <> '' 
  and codigo_retorno = '201'
  
order by 1,2,3