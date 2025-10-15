SELECT esoeve.EMPRESA,
       esocial.evento,
       esoeve.RECIBO,
       esoeve.CHAVE,
       esoeve.VALIDADE_INICIO
         FROM empresas_esocial AS esocial,
             empresas_esocial_eventos AS esoeve
         WHERE esocial.empresa = esoeve.empresa AND
             esocial.agendamento = esoeve.agendamento AND
             esoeve.recibo IS NOT NULL AND
             esocial.evento IN ('S-1000', 'S-1030', 'S-2200', 'S-2205', 'S-2206',  'S-2300') AND
             esoeve.STATUS = 70
UNION

SELECT empresa,
       'S-2200' as EVENTO,
       esocial_recibo AS RECIBO,
       matricula AS CHAVE,
	   ''
        FROM P_TRABALHADORES
        where esocial_recibo <> ''
order by 1,2,4,5