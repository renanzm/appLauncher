SELECT id_sindicat,
	   nomesindicato,
	   sigla,
	   cnpj,
	   endereco,
	   cep,
	   bairro, 
       fone,
	   fax,
	   emailinternet,
	   codigomunicipioibge,
	   codigoentidadesindical, 
       dectercreajustado,
	   web
FROM dpcuca.sindicat
ORDER BY id_sindicat;
