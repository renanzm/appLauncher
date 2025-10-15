SELECT id_sindpatr,
       nomesindicato,
	   sigla,
	   cnpj,
	   endereco,
	   cep,
	   bairro, 
       fone,
	   fax,
	   emailinternet,
	   web,
	   codigomunicipioibge,
	   codigoentidadesindical
FROM dpcuca.sindpatr
ORDER BY id_sindpatr;
