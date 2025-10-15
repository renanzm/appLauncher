with dados as (
    select '{empresa}' as EMPRESA,
           lb.codfun,
           lb.nome,
           lb.tipo,
           lb.cpf,
           lb.codoper,
           lb.anomes,
           case 
             when exists (select 1 from f{empresa}.lanc_benef lb1 where lb1.codfun = lb.codfun and tipo = 'TITULAR')
              and not exists (select 1 from f{empresa}.lanc_benef lb1 where lb1.codfun = lb.codfun and tipo = 'DEPENDENTE') 
               then '1'
             when exists (select 1 from f{empresa}.lanc_benef lb1 where lb1.codfun = lb.codfun and tipo = 'TITULAR')
              and exists (select 1 from f{empresa}.lanc_benef lb1 where lb1.codfun = lb.codfun and tipo = 'DEPENDENTE') 
               then '2'
             when not exists (select 1 from f{empresa}.lanc_benef lb1 where lb1.codfun = lb.codfun and tipo = 'TITULAR')
              and exists (select 1 from f{empresa}.lanc_benef lb1 where lb1.codfun = lb.codfun and tipo = 'DEPENDENTE') 
               then '3'
           end as TIPO_BENEFICIARIO,
           o.tipoplano,
           row_number() over (
               partition by lb.codfun, lb.tipo, o.tipoplano
               order by lb.anomes desc
           ) as rn
      from f{empresa}.lanc_benef lb
      inner join genfolha.opersaude o 
              on lb.codoper = o.codoper
     where o.tipoplano in ('1','2')
)
select *
from dados
where rn = 1
order by 1, 2, 7;
