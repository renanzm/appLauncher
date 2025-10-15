select *,
       (select max(f.prefixo)  from public.telefone as f where f.chv_enti = entidade.chv_enti ) as ddd,
       (select max(f.telefone) from public.telefone as f where f.chv_enti = entidade.chv_enti ) as telefone,
	   (select max(e.email) from public.email as e where e.chv_enti = entidade.chv_enti ) as email,
	   (SELECT max(sc.mesesdissidio) FROM public.rh_sindicato_contratuais as sc where sc.chv_sindicato = entidade.chv_enti ) as mesbase,
	   (SELECT max(s.codigosindicato) FROM public.rh_sindicato as s where s.chv_sindicato = entidade.chv_enti ) as codigo_entidade,
	   (SELECT max(s.agenciacef) FROM public.rh_sindicato as s where s.chv_sindicato = entidade.chv_enti ) as agencia,
	   case (SELECT max(1) FROM public.rh_empresa_rais as er where er.sindicato_patronal = entidade.codigo) when 1 then 'P' else 'E' end as tipo_sindicato
	   
 from public.entidade left outer join public.endereco 
                                      on endereco.chv_enti = entidade.chv_enti 
									  
where left(entidade.chv_enti,5) = '0020|'   /* código 0020 na chave indicar ser sindicato */
order by codigo