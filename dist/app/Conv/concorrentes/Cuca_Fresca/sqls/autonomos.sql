SELECT autonomo.codigoempresa AS cod_empresa,
       autonomo.id_tbauton AS codautonomo,
       autonomo.*,
       tbauton.*,
       (SELECT cod_tbocorrencia FROM dpcuca.tbocorrencias WHERE tbocorrencias.id_tbocorrencias = autonomo.id_tbocorrencias) AS codocorrencia,
       (SELECT tbcbo.codcbo FROM dpcuca.tbcbo WHERE tbcbo.id_tbcbo = tbauton.id_tbcbo) AS codcbo
FROM dpcuca.autonomo
LEFT JOIN dpcuca.tbauton
ON tbauton.id_tbauton = autonomo.id_tbauton
ORDER BY 1, 2