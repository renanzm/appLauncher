SELECT codigoempresa,
       codigoempregado,
       datalanc,
       evento,
       quantidade,
       vrunitario,
       vencimentos 
  FROM dpcuca.lancam
 WHERE DATE_PART('year', datalanc) >= DATE_PART('year', CURRENT_DATE) -3
ORDER BY 1,2,3,4