SELECT funcionarios.empresa,
       funcionarios.funcionario,
	   nome,
	   datanascimento,
	   sexo,
	   racacor,
	   (SELECT municipios.nome
	    FROM municipios
	   WHERE municipios.municipio = funcionarios.naturalidade) AS local_nasc,
	   nomemae,
	   nomepai,
	   escolaridade,
	   tipomovto,
	   tipoadmissaorais,
	   vinculoempregaticio,
	   nacionalidade,
       datachegadabrasil,
	   dataopcaofgts,
   	   dataadmissao,
	   diasexperiencia,
   	   diasprorrogar,
	   datademissao,
   	   conta,
	   datatransferencia,
   	   contafgts,
	   validadeexame,
   	   pis,
	   datapis,
   	   cpf,
	   ctps,
       seriectps,
	   ufctps,
   	   datactps,
	   rg,
	   orgaoemissorrg,
	   ufrg,
	   datarg,
   	   documentomilitar,
	   reservista,
   	   categoriareservista,
	   tituloeleitor,
   	   zonaeleitor,
	   secaoeleitor,
	   habilitacao,
	   datavalidadehabilitacao,
	   tipohabilitacao,
	   estagiario,
	   datainscricao,
	   registro,
	   ficha,
	   funcionariosindicalizado,
	   nomecompleto,
	   tipocontrato,
	   (SELECT municipios.estado
	    FROM municipios
	    WHERE municipios.municipio = funcionarios.naturalidade) AS uf_local_nasc,
	   inscricaoinss,
	   (SELECT MAX(jornada) 
	      FROM funcionariossalarios
         WHERE funcionariossalarios.empresa = funcionarios.empresa
           AND funcionariossalarios.funcionario = funcionarios.funcionario
		   AND to_number(funcionariossalarios.competeinverte,'000000') = (SELECT MAX(to_number(func2.competeinverte,'000000'))
		                                          					       FROM funcionariossalarios AS func2
				                                                          WHERE func2.empresa = funcionarios.empresa AND
				                                                                func2.funcionario = funcionarios.funcionario) ) as jornada
	   
FROM funcionarios
ORDER BY funcionarios.empresa, funcionarios.funcionario, funcionarios.nome