select TABFP1000.EMPRE_1000 as empresa,
       TABFP1000.EMPRE_1000 as codigo,
       TABFP1000.RECIB_1000 as recibo,
       TABFP1000.EMPRE_1000 as codigoe,
       '' as data,
       '1000' as evento,
       '' as afastamento
from TABFP1000
where left(TABFP1000.RECIB_1000,3) = '1.1'

union all

select TABFP1030.EMPRE_1030 as empresa,
       TABFP1030.CODIG_1030 as codigo,
       TABFP1030.RECIB_1030 as recibo,
       TABFP1030.CODIG_1030 as codigoe,
	   '' as data,
       '1030' as evento,
       '' as afastamento
from TABFP1030
where left(TABFP1030.RECIB_1030,3) = '1.1'

union all

select TABFP2200.FILIA_2200 as empresa,
       TABFP2200.CODIG_2200 as codigo,
       TABFP2200.RECIB_2200 as recibo, 
       TABFPFUN3.MATRI_FUN3 as codigoe,
	   '' as data,
       '2200' as evento,
       '' as afastamento
from TABFP2200 left join TABFPFUN3 on (TABFP2200.FILIA_2200 = TABFPFUN3.EMPRE_FUN3 and TABFP2200.CODIG_2200 = TABFPFUN3.CODIG_FUN3 )
where left(TABFP2200.RECIB_2200,3) = '1.1'

union all

select TABFP2205.FILIA_2205 as empresa,
       TABFP2205.CODIG_2205 as codigo,
       TABFP2205.RECIB_2205 as recibo, 
       TABFPFUN3.MATRI_FUN3 as codigoe,
	   TABFP2205.DTALT_2205 as data,
       '2205' as evento,
       '' as afastamento
from TABFP2205 left join TABFPFUN3 on (TABFP2205.FILIA_2205 = TABFPFUN3.EMPRE_FUN3 and TABFP2205.CODIG_2205 = TABFPFUN3.CODIG_FUN3 )
where left(TABFP2205.RECIB_2205,3) = '1.1'

union all

select TABFP2206.FILIA_2206 as empresa,
       TABFP2206.CODIG_2206 as codigo,
       TABFP2206.RECIB_2206 as recibo, 
       TABFPFUN3.MATRI_FUN3 as codigoe,
	   TABFP2206.DTALT_2206 as data,
       '2206' as evento,
       '' as afastamento
from TABFP2206 left join TABFPFUN3 on (TABFP2206.FILIA_2206 = TABFPFUN3.EMPRE_FUN3 and TABFP2206.CODIG_2206 = TABFPFUN3.CODIG_FUN3 )
where left(TABFP2206.RECIB_2206,3) = '1.1'

union all

select TABFP2230.FILIA_2230 as empresa,
       TABFP2230.CODIG_2230 as codigo,
       TABFP2230.RECIB_2230 as recibo, 
       TABFPFUN3.MATRI_FUN3 as codigoe,
	   '' as data,
       '2230' as evento,
       TABFP2230.DTINI_2230 as afastamento
from TABFP2230 left join TABFPFUN3 on (TABFP2230.FILIA_2230 = TABFPFUN3.EMPRE_FUN3 and TABFP2230.CODIG_2230 = TABFPFUN3.CODIG_FUN3 )
where left(TABFP2230.RECIB_2230,3) = '1.1'

union all

select TABFP2300.FILIA_2300 as empresa,
       TABFP2300.CODIG_2300 as codigo,
       TABFP2300.RECIB_2300 as recibo,
       TABFPFUN3.MATRI_FUN3 as codigoe,
	   '' as data,
       '2300' as evento,
       '' as afastamento
from TABFP2300 left join TABFPFUN3 on (TABFP2300.FILIA_2300 = TABFPFUN3.EMPRE_FUN3 and TABFP2300.CODIG_2300 = TABFPFUN3.CODIG_FUN3 )
where left(TABFP2300.RECIB_2300,3) = '1.1'
group by empresa, codigo, evento, codigoe, recibo
ORDER BY 1,6,2