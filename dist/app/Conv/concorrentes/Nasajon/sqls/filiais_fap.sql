select estabelecimentos.empresa,
       historicosgpsestabelecimentos.estabelecimento,
       to_date(historicosgpsestabelecimentos.ano::text || historicosgpsestabelecimentos.mes::text, 'YYYYMM') AS competencia,
       historicosgpsestabelecimentos.aliquotafap
  from persona.historicosgpsestabelecimentos
 inner join ns.estabelecimentos
    on estabelecimentos.estabelecimento = historicosgpsestabelecimentos.estabelecimento
 order by 1, 2, 3;