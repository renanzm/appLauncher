SELECT func.ID_EMPRESA,
       func.CODIGO,
       func.TIPO,
       aqui.ID,
       aqui.ID_FUNC_SADE,
       aqui.PERIODO_AQUIS_INI,
       aqui.PERIODO_AQUIS_FIM,
       aqui.FALTA_NO_PERIODO
  FROM FP_FUNCIONARIO_SADE_FERIAS aqui
  LEFT JOIN FP_FUNCIONARIO_SADE func
    ON func.ID = aqui.ID_FUNC_SADE
 ORDER BY 1, 2, 3, 5;