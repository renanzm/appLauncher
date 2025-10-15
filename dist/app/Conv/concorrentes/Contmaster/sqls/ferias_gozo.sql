SELECT func.ID_EMPRESA,
       func.CODIGO,
       func.TIPO,
       gozo.ID,
       gozo.ID_FERIAS,
       gozo.GOZO_INI,
       gozo.GOZO_FIM,
       gozo.DIAS_PAGOS,
       gozo.ABONO_PECUNIARIO
  FROM FP_FUNC_SADE_FERIAS_GOZO gozo
 INNER JOIN FP_FUNCIONARIO_SADE_FERIAS aqui
    ON aqui.ID = gozo.ID_FERIAS
 INNER JOIN FP_FUNCIONARIO_SADE func
    ON func.ID = aqui.ID_FUNC_SADE
 ORDER BY 1, 2, 3, 5;