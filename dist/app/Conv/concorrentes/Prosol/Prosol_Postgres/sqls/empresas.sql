select *,
       (select max(c.codigo) from public.empresa_cnae as c where c.chv_enti = entidade.chv_enti and c.principal = true ) as cnae,
       (select max(e.email)  from public.email as e where e.chv_enti = entidade.chv_enti ) as email,
       (select max(r.data_registro)   from public.entidade_orgao_registro as r where r.chv_enti = entidade.chv_enti ) as data_registro,
       (select max(r.descricao)       from public.entidade_orgao_registro as r where r.chv_enti = entidade.chv_enti ) as nome_registro,
       (select max(r.numero_registro) from public.entidade_orgao_registro as r where r.chv_enti = entidade.chv_enti ) as numero_registro,
       (select max(f.prefixo)  from public.telefone as f where f.chv_enti = entidade.chv_enti ) as ddd,
       (select max(f.telefone) from public.telefone as f where f.chv_enti = entidade.chv_enti ) as telefone,
       (select max(t.naturezajuridica)    from public.entidadetribu as t where t.chv_enti = entidade.chv_enti ) as naturezajuridica,
       (select max(t.datainicioatividade) from public.entidadetribu as t where t.chv_enti = entidade.chv_enti ) as datainicioatividade,
       (select max(t.dataencerramento)    from public.entidadetribu as t where t.chv_enti = entidade.chv_enti ) as dataencerramento,
       (select max(t.codigoatividade)     from public.entidadetribu as t where t.chv_enti = entidade.chv_enti ) as codigoatividade,
       (select max(t.dataregistro)        from public.entidadetribu as t where t.chv_enti = entidade.chv_enti ) as dataregistro,
       (select max(t.nroregistro)         from public.entidadetribu as t where t.chv_enti = entidade.chv_enti ) as nroregistro,
       (select max(t.orgao)               from public.entidadetribu as t where t.chv_enti = entidade.chv_enti ) as orgao
	   
  from public.entidade left outer join public.endereco 
    on endereco.chv_enti = entidade.chv_enti 
	
 where left(entidade.chv_enti,5) = '0002|'  /* código 0002 na chave indicar ser empresa */
 

 order by 3