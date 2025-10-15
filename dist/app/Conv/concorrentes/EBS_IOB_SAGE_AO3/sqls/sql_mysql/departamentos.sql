SELECT CD_EMPRESA,
       CD_FILIAL,
       CD_NIVEL1,
       DESCRICAO  
  FROM Estrutura
 WHERE cd_nivel2 = 0 
   AND cd_nivel3 = 0

ORDER BY 1,2,3