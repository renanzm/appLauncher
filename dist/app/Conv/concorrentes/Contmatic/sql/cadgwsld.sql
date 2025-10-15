select cadgwsldid,
       apelidocadgwsld,
       substring(xavecadgwsld, 1, 3) as identificador,
       substring(xavecadgwsld, 4) as inddata,
       n1,
       x1,
       i1,
       x1extra,
       x3extra,
       x4extra,
       x5extra
  from public.cadgwsld