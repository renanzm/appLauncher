 SELECT DISTINCT R.[Código da empresa],
        A.[Código do autônomo],
		A.[Nome],
		A.[Endereço],
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
		A.[Matrícula esocial],
		R.[Data do pagamento]
  FROM [dbo].[Autônomos] AS A
       LEFT OUTER JOIN [dbo].[Recibos] AS R
	   on A.[Código do autônomo] = R.[Código do autônomo]
 WHERE R.[Data do pagamento] = ( SELECT MIN (R2.[Data do pagamento]) 
                                   FROM [dbo].[Recibos] AS R2 
								  WHERE R2.[Código da empresa] = R.[Código da empresa]
								    and R2.[Código do autônomo] = R.[Código do autônomo] )
  and year(R.[Data do pagamento]) > year(CURRENT_TIMESTAMP) - 3
 ORDER BY 1,2,3