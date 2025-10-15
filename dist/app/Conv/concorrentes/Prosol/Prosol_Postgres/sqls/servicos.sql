SELECT *

 FROM public.local left outer join public.endereco 
                                   on '0023|' || local.chv_enti || '|' || local.codigo = endereco.chv_enti  /* código 0023 na chave indica ser "Tomador/Local" que corresponde a nossos Serviços */
	               left outer join public.rh_unidade_encargos                                    
								   on rh_unidade_encargos.codigo_unidade = local.chv_enti || '|' || local.codigo
                   left outer join public.rh_unidade                                    
								   on rh_unidade.chv_enti = local.chv_enti
								  and rh_unidade.chv_local = local.codigo
 where local.chv_enti is not null  
 
ORDER BY 1,2 asc