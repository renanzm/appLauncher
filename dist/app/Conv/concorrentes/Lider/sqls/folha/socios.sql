SELECT  [C�digo da empresa],
		[Respons�vel contato],
		[Respons�vel cpf contato],
		[Respons�vel telefone],
		[Respons�vel email]
FROM Empresas
WHERE [Respons�vel contato] <> '' AND [Respons�vel cpf contato] <> ''
ORDER BY 1