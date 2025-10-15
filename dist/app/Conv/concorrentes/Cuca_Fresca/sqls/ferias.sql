SELECT codigoempresa,
       codigoempregado,
       inicioaquisitivo,
	   terminoaquisitivo,
	   faltasjustificadas,
	   feriasdias,
	   iniciogozo,
	   terminogozo,
	   datapagamento,
	   diasremun
  FROM dpcuca.ferias
  
UNION ALL

SELECT codigoempresa,
       codigoempregado,
       inicioaquisitivo,
	   terminoaquisitivo,
	   faltasjustificadas1,
	   feriasdias1,
	   iniciogozo1,
	   terminogozo1,
	   datapagamento1,
	   diasremun1
  FROM dpcuca.ferias
WHERE iniciogozo1 is not null

UNION ALL

SELECT codigoempresa,
       codigoempregado,
       inicioaquisitivo,
	   terminoaquisitivo,
	   faltasjustificadas2,
	   feriasdias2,
	   iniciogozo2,
	   terminogozo2,
	   datapagamento2,
	   diasremun2
  FROM dpcuca.ferias
 WHERE iniciogozo2 is not null
ORDER BY 1,2,3,7