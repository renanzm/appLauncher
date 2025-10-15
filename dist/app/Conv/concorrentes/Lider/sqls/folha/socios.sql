SELECT  [Código da empresa],
		[Responsável contato],
		[Responsável cpf contato],
		[Responsável telefone],
		[Responsável email]
FROM Empresas
WHERE [Responsável contato] <> '' AND [Responsável cpf contato] <> ''
ORDER BY 1