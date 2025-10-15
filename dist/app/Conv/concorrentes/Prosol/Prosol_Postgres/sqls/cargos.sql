SELECT chv_colaborador,
       codigofuncao,
	   funcao_descricao,
	   cbo,
	   1 as uniao
 FROM public.rh_contrato
where codigofuncao is not null
  
union
 
SELECT chv_colaborador,
       funcao,
	   funcao_descricao,
	   cbo,
	   2 as uniao
 FROM public.rh_contrato_salario
where funcao is not null
  and not exists (select 1
                    FROM public.rh_contrato as c
                   where c.codigofuncao = funcao)
union

SELECT chv_colaborador,
       funcao,
	   funcao_descricao,
	   cbo,
	   3 as uniao
 FROM public.rh_alteracao_salarioefuncao
where funcao is not null
  and not exists (select 1
                    FROM public.rh_contrato as c
                   where c.codigofuncao = funcao) 
  and not exists (select 1
                    FROM public.rh_contrato_salario as cs
                   where cs.funcao = funcao)
				   
order by 1,
         2,
         3,
		 1 desc,
		 4,
		 5