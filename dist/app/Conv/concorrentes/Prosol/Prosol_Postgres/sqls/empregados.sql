SELECT *,
	   (select max(origem.cnpjcpf) from public.entidade as origem where origem.chv_enti = rh_transferencia_empresa_colaborador.empresa_origem ) as inscricao_origem,
	   (select max(origem.nome) from public.entidade as origem where origem.chv_enti = rh_transferencia_empresa_colaborador.empresa_origem ) as nome_empresa_origem,
	   (select max(origem.dataadmissao) from public.rh_contrato as origem where origem.chv_colaborador = rh_transferencia_empresa_colaborador.empresa_origem || '|' || rh_transferencia_empresa_colaborador.codigo_antigo_colaborador) as admissao_empresa_origem,
	   (select max(e.email) from public.email as e where e.chv_enti = rh_colaborador.chv_colaborador ) as email,
	   (select max(f.prefixo)  from public.telefone as f where f.chv_enti = rh_colaborador.chv_colaborador ) as ddd,
       (select max(f.telefone) from public.telefone as f where f.chv_enti = rh_colaborador.chv_colaborador and left(f.telefone ,1) <> '9' ) as telefone,
	   (select max(f.telefone) from public.telefone as f where f.chv_enti = rh_colaborador.chv_colaborador and left(f.telefone ,1) = '9') as celular,
	   (select max(doc.documentos) from public.rh_documentos as doc where doc.chv_colaborador = rh_colaborador.chv_colaborador and doc.tipo = '1') as documentos_cnh,
	   (select max(doc.documentos) from public.rh_documentos as doc where doc.chv_colaborador = rh_colaborador.chv_colaborador and doc.tipo = '2') as documentos_rg,
	   (select max(doc.documentos) from public.rh_documentos as doc where doc.chv_colaborador = rh_colaborador.chv_colaborador and doc.tipo = '3') as documentos_pis,
	   (select max(doc.documentos) from public.rh_documentos as doc where doc.chv_colaborador = rh_colaborador.chv_colaborador and doc.tipo = '4') as documentos_ctps,
	   (select max(doc.documentos) from public.rh_documentos as doc where doc.chv_colaborador = rh_colaborador.chv_colaborador and doc.tipo = '5') as documentos_eleitoral,
	   (select max(doc.documentos) from public.rh_documentos as doc where doc.chv_colaborador = rh_colaborador.chv_colaborador and doc.tipo = '6') as documentos_reservista,
	   (select max(compl.primeiro_emprego) from public.esocial_colaborador_dados_complementares as compl where compl.chv_colaborador = rh_colaborador.chv_colaborador ) as primeiro_emprego,
	   (select max(compl.uf_cnh) from public.esocial_colaborador_dados_complementares as compl where compl.chv_colaborador = rh_colaborador.chv_colaborador ) as uf_cnh,
	   (select max(compl.categoria) from public.esocial_colaborador_dados_complementares as compl where compl.chv_colaborador = rh_colaborador.chv_colaborador ) as categoria_esocial,
	   (select max(compl.matriculaesocial) from public.esocial_colaborador_dados_complementares as compl where compl.chv_colaborador = rh_colaborador.chv_colaborador ) as matricula_esocial,
	   (select max(substring( chv_colaborador , 6 + STRPOS( substring(chv_colaborador , 6 ), '|' ), length(chv_colaborador)) ) 
	      from public.esocial_colaborador_quadro_horario 
		 where esocial_colaborador_quadro_horario.chv_colaborador = rh_colaborador.chv_colaborador ) as jornada,
		(select max(fer.aquisitivo_fim  + interval '11 months') from public.rh_ferias as fer where fer.chv_colaborador = rh_colaborador.chv_colaborador ) as vencimento_ferias,
		(select max(sal.salario) from public.rh_contrato_salario as sal where sal.chv_colaborador = rh_colaborador.chv_colaborador and sal.data = (select min(sal2.data) from public.rh_contrato_salario as sal2 where sal2.chv_colaborador = rh_colaborador.chv_colaborador ) ) as salario_contratual
	   
  
  FROM public.rh_colaborador left outer join public.rh_contrato
                                          on rh_colaborador.chv_colaborador = rh_contrato.chv_colaborador 
	                         left outer join public.endereco
                                          on rh_colaborador.chv_colaborador = endereco.chv_enti
			                 left outer join public.rh_contrato_adicionais
                                          on rh_colaborador.chv_colaborador = rh_contrato_adicionais.chv_colaborador
						     left outer join public.rh_contrato_rais
                                          on rh_colaborador.chv_colaborador = rh_contrato_rais.chv_colaborador
							 left outer join public.rh_contrato_sefip
                                          on rh_colaborador.chv_colaborador = rh_contrato_sefip.chv_colaborador
							 left outer join public.rh_transferencia_empresa_colaborador
                                          on rh_colaborador.chv_colaborador = rh_transferencia_empresa_colaborador.empresa_destino || '|' || rh_transferencia_empresa_colaborador.colaborador
							 left outer join public.rh_colaborador_banco
                                          on rh_colaborador.chv_colaborador = rh_colaborador_banco.chv_colaborador
										  	               
  
 order by rh_colaborador.chv_colaborador