SELECT CE.id_primario,
       T.codigo,
       CE.recibo,
       CE.chave1,
	   CE.descricao,
	   CE.id_secundario
FROM dpcuca.cargasesocial AS CE
INNER JOIN dpcuca.tipos_arquivos_esocial T
ON (CE.id_tipos_arquivos_esocial = T.ID)
WHERE (recibo <> '') AND (codigo IN ('S-1000', 'S-1030', 'S-2200', 'S-2300'))
ORDER BY 1, 2, 5