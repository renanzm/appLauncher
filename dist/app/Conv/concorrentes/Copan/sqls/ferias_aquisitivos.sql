SELECT DISTINCT
       aqui.COD_EMP,
       aqui.TIPO,
       aqui.COD_FUN,
       aqui.PAQUI_INI,
       aqui.PAQUI_FIM
  FROM PAQUISITIVO aqui
  LEFT JOIN RECIBO rec
    ON rec.COD_EMP = aqui.COD_EMP
   AND rec.TIPO = aqui.TIPO
   AND rec.COD_FUN = aqui.COD_FUN
   AND rec.PAQUISI_INI = aqui.PAQUI_INI
   AND rec.TIPO_RECIBO = 3
 ORDER BY aqui.COD_EMP,
          aqui.TIPO,
          aqui.COD_FUN,
          aqui.PAQUI_INI;