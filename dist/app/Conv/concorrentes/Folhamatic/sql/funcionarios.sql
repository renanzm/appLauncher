SELECT '{empresa}' AS EMPRESA,
	   f.CODFUN,
	   f.NOME,
	   f.CPF,
	   f.MATRICULA,
	   f.FUNCAO,
	   f.SETOR,
	   f.DEPTO,
	   f.CODSIND,
	   f.DTADM,
	   f.DTNEWAQINI,
	   f.TIPSAL,
	   f.VINEMP,
	   f.CATEGO,
	   f.INICONTR,
	   f.FIMCONTR,
	   f.PROCONTR,
	   f.TIPADM,
	   f.DTTRANSF,
	   funcdoc.Cod_hor AS HOR1,
	   f.HRSMES,
	   f.HRSSEM,
	   f.SINDICAL,
	   f.TPFGTS,
	   f.DTOPFG,
	   LPAD(f.BCOSAL,3,'0') AS BCOSAL,
	   f.CC,
	   f.DTEPER,
	   f.DTEADM,
	   f.DTPIS,
	   f.PIS,
	   f.CBCOPIS,
	   f.CAGEPIS,
	   f.ENDPIS,
	   f.NUMCP,
	   f.SERCP,
	   f.DTCTPS,
	   f.UFCP,
	   f.OCORREN,
	   f.PAI,
	   f.MAE,
	   f.ENDERECO,
	   f.NUMERO,
	   f.COMPLE,
	   f.BAIRRO,
	   f.CID,
	   f.UF,
	   f.CEP,
	   f.TELEFONE,
	   f.TELEFONE2,
	   f.NASC,
	   f.UFNATU,
	   f.NATURA,
	   f.RACACOR,
	   f.SEXO,
	   f.NACIO,
	   f.DTGRINGO,
	   f.RGGRINGO,
	   f.CTGRINGO,
	   f.ECIVIL,
	   f.GRINST,
	   f.DEFIC,
	   f.NUMRG,
	   f.ORGRG,
	   f.UFRG,
	   f.DTEMRG,
	   f.NUMCNH,
	   f.CATCNH,
	   f.VENCNH,
	   f.NUMTIT,
	   f.ZONVOT,
	   f.SECVOT,
	   f.RESERVA,
	   f.CATRESERVA,
	   f.TIPOCC,
	   f.EMAIL,
	   f.BRGRINGO,
	   f.FLGRINGO,
	   f.ALVARA,
	   f.DTRES,
	   f.CBO,
	   f.CBO2,
	   f.DEPSETSEC,
	   f.SIND,
	   f.HOR2,
	   f.DIAUNI,
	   f.HORUNI,
	   f.NUMGUIA,
	   f.NUMGUIAP,
	   f.UFCNH,
	   f.AGDSAL,
	   f.DVAGESAL,
	   f.DVCC,
	   funcdoc.CODCATEG AS CATEGORIA_ESOC,
	   f.TRANSPORTA,
	   funcdoc.INSEMPANT AS INSCRICAO_TRANSF,
	   funcdoc.MATREMPANT AS MATRICULA_TRANSF,
	   funcdoc.CESSAOONUS AS TIPO_TRANSF,
	   funcdoc.AREAESTAG AS AREAESTAG,
	   funcdoc.APOLESTAG AS APOLESTAG,
	   funcdoc.CNPJINST AS CNPJINST,
	   funcdoc.RAZAOINST AS RAZAOINST,
	   funcdoc.COORDINST AS COORDINST,
	   funcdoc.CPFINST AS CPFINST,
	   funcdoc.CNPJAGENTE AS CNPJAGENTE,
	   funcdoc.RAZAGENTE AS RAZAGENTE,
	   funcdoc.INDICADM AS INDICADM,
	   coalesce((select d.DEPSETSEC
				 from f{empresa}.depto as d inner join f{empresa}.FUNCDEPTO as t
				 	on t.DEPTO = d.CODDEPTO
				 where (d.TPLOTACAO = '01' or d.DEPSETSEC = '000100000000')
				and f.CODFUN = t.CODFUN
				and t.ANOMES not like '% %'
				and TO_DATE(t.ANOMES, 'YYYYMM') = (select TO_DATE(t2.ANOMES, 'YYYYMM')
												  	  from f{empresa}.FUNCDEPTO as t2
												      where t2.CODFUN = f.CODFUN 
													    and t2.ANOMES not like '% %'
												  	order by t2.ANOMES asc
												  limit 1)
				order by d.DEPSETSEC asc
				limit 1),'000100000000') as i_depto,
	  
	   coalesce((select d.DEPSETSEC
				 from f{empresa}.depto as d inner join f{empresa}.FUNCDEPTO as t
				 	on t.DEPTO = d.CODDEPTO
				 where (d.TPLOTACAO <> '01' or d.DEPSETSEC = '000100000000')
				and f.CODFUN = t.CODFUN
				and t.ANOMES not like '% %'
				and TO_DATE(t.ANOMES, 'YYYYMM') = (select TO_DATE(t2.ANOMES, 'YYYYMM') 
												  	  from f{empresa}.FUNCDEPTO as t2
												      where t2.CODFUN = f.CODFUN 
													    and t2.ANOMES not like '% %'
												  order by t2.ANOMES desc /*Ajustar para ASC para levar o primeiro servico do empregado para implementar as trocas de servico, situacao tratada no pull 784*/
												  limit 1) 
				order by d.DEPSETSEC asc
				limit 1),'000100000000') as i_servico,
		( select max(funcao.codfuncao)
		    from f{empresa}.funcoes as funcao
		   where funcao.descricao = f.FUNCAO) as CODIGO_FUNCAO	
				
FROM f{empresa}.func f left outer join f{empresa}.funcdoc as funcdoc
							  on funcdoc.codfun = f.codfun
							 and funcdoc.pk_padrao = (select subfd.pk_padrao 
												 	from f{empresa}.funcdoc as subfd
												 where funcdoc.codfun = subfd.codfun
												order by subfd.pk_padrao desc
												LIMIT 1)
ORDER BY f.CODFUN ASC

