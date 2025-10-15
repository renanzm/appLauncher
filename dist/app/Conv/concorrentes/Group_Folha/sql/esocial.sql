SELECT IdGrupoEmpresa as 'CODI_EMP','' as 'CODIGO',IdEventoGFolha as 'EVENTO',ReciboRetornoProcessamento as 'RECIBO','' as 'CODIGO ESOCIAL' 
  FROM [dbo].GF_ES_MonitorEventos
 WHERE IdEventoGFolha = 1000
   AND ReciboRetornoProcessamento <> ''

UNION

SELECT DISTINCT IdGrupoEmpresa,GF_ES_s1030.codCargo,IdEventoGFolha,ReciboRetornoProcessamento,GF_ES_s1030.CodigoeSocial
  FROM [dbo].GF_ES_MonitorEventos
LEFT JOIN GF_ES_s1030
       ON GF_ES_MonitorEventos.CodigoeSocial = GF_ES_s1030.CodigoeSocial
WHERE CodRespostaProcessamento = 201
  AND ReciboRetornoProcessamento <> ''
  AND IdEventoGFolha = 1030
  AND codCargo <> ''
  AND Ambiente = 1

UNION

SELECT DISTINCT IdGrupoEmpresa,GF_ES_s2200.IdFuncionario,IdEventoGFolha,ReciboRetornoProcessamento,GF_ES_s2200.matricula 
  FROM [dbo].GF_ES_MonitorEventos
LEFT JOIN GF_ES_s2200
       ON GF_ES_MonitorEventos.CodigoeSocial = GF_ES_s2200.matricula
WHERE CodRespostaProcessamento = 201
  AND ReciboRetornoProcessamento <> ''
  AND IdEventoGFolha = 2200
  AND IdFuncionario <> ''

UNION

SELECT DISTINCT IdGrupoEmpresa,GF_ES_s2300.IdFuncionario,IdEventoGFolha,ReciboRetornoProcessamento,GF_ES_s2300.matricula 
  FROM [dbo].GF_ES_MonitorEventos
LEFT JOIN GF_ES_s2300
       ON GF_ES_MonitorEventos.CodigoeSocial = GF_ES_s2300.matricula
WHERE CodRespostaProcessamento = 201
  AND ReciboRetornoProcessamento <> ''
  AND IdEventoGFolha = 2300
  AND IdFuncionario <> ''

ORDER BY 1,3