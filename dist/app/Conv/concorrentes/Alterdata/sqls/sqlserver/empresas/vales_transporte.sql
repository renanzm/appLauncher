SELECT DISTINCT func.idfuncionario,
	   frmpasq.idpassagem,
	   passagb.tpfrequencia,
	   frmpasq.dtinicial,
	   frmpasq.dtfinal,
       MAX(frmpasq.qtdmensal) AS qtdmensal
FROM wdp.p{codi_emp} AS func
INNER JOIN wdp.frmpasq
ON frmpasq.idformacaopassagem = func.idformacaopassagens
INNER JOIN wdp.passagb
ON passagb.idpassagem = frmpasq.idpassagem
WHERE YEAR(frmpasq.dtinicial) <= YEAR(GETDATE())
GROUP BY func.idfuncionario, frmpasq.idpassagem, passagb.tpfrequencia, frmpasq.dtinicial, frmpasq.dtfinal
ORDER BY 1, 2, 4 DESC