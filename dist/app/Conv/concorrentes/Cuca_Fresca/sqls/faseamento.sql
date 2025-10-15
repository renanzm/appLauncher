SELECT CE.id_primario,
MIN(CE.inicio) as data_esocial
FROM dpcuca.cargasesocial AS CE
INNER JOIN dpcuca.tipos_arquivos_esocial T
ON (CE.id_tipos_arquivos_esocial = T.ID)
WHERE (recibo <> '') AND (codigo = 'S-1000')
group by CE.id_primario