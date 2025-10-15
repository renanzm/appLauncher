SELECT prolabor.*,
      (SELECT MAX(sub.valor) FROM dpcuca.tbsalmin AS sub WHERE sub.datainicio <= prolabor.inicio) * qtdesalminimos AS valor_salario
FROM dpcuca.prolabor
WHERE VALOR > 0
ORDER BY 2, 3, 4