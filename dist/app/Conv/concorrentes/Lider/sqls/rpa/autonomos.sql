 SELECT DISTINCT R.[C�digo da empresa],
        A.[C�digo do aut�nomo],
		A.[Nome],
		A.[Endere�o],
		A.[Bairro],
		A.[Cidade],
		A.[Uf],
		A.[Cep],
		A.[Telefone],		
		A.[Celular],
		A.[Email],
		A.[Cpf],
		A.[Identidade],
		A.[Cbo],
		A.[Cargo],		
		A.[Cadastro esocial],
		A.[Data de nascimento],	
		A.[Categoria para esocial],	
		A.[Matr�cula esocial],
		R.[Data do pagamento]
  FROM [dbo].[Aut�nomos] AS A
       LEFT OUTER JOIN [dbo].[Recibos] AS R
	   on A.[C�digo do aut�nomo] = R.[C�digo do aut�nomo]
 WHERE R.[Data do pagamento] = ( SELECT MIN (R2.[Data do pagamento]) 
                                   FROM [dbo].[Recibos] AS R2 
								  WHERE R2.[C�digo da empresa] = R.[C�digo da empresa]
								    and R2.[C�digo do aut�nomo] = R.[C�digo do aut�nomo] )
  and year(R.[Data do pagamento]) > year(CURRENT_TIMESTAMP) - 3
 ORDER BY 1,2,3