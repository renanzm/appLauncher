SELECT DISTINCT 
		emp.empresa as CODI_EMP,
		'' as CODIGO,
		s1000.recibo as RECIBO,
		'' as CODIGO_ESOCIAL,
		'' as IDEMPREGADOS,
        '' as DATA,
		'1000' as EVENTO
  FROM esocialevtinfoempregador s1000 
 INNER JOIN empresas emp ON (s1000.idempregador = emp.idempregador)
 WHERE s1000.cdrespostaprocessamento IN ('201','202')
   AND s1000.tipoambiente = 1
   
UNION

SELECT 
	   s1005.empresa, 
       s1005.departamento,
	   s1005.recibo,
	   dep.codigoesocial,
	   '',
       '',
	   '1005'
  FROM esocialevttabestab s1005 
  LEFT JOIN departamentos dep ON (s1005.empresa = dep.empresa 
						      AND s1005.departamento = dep.departamento)
 WHERE s1005.cdrespostaprocessamento IN ('201','202')
   AND s1005.tipoambiente = 1
   AND s1005.operacao = 1
   AND s1005.nrinscricao IS NOT NULL
   AND s1005.empresa IS NOT NULL

UNION

SELECT DISTINCT
	   s1020.empresa, 
       s1020.departamento,
	   s1020.recibo,
	   dep.codigoesocial,
	   '',
       '',
	   '1020'
  FROM esocialevttablotacao s1020 LEFT JOIN departamentos dep ON (s1020.empresa = dep.empresa AND s1020.departamento = dep.departamento)
 WHERE s1020.cdrespostaprocessamento IN ('201','202')
   AND s1020.tipoambiente = 1
   AND s1020.operacao = 1
 
 UNION
 
 SELECT DISTINCT 
       emp.empresa,
	   (SELECT funcao
		  FROM funcoes f
		 WHERE f.codigoesocial = s1030.codigocargo
		   AND f.idempregador = s1030.idempregador)::text codigo, 
	   s1030.recibo, 
	   s1030.codigocargo matricula,
	   '',
       '',
	   '1030'
  FROM esocialevttabcargo s1030 INNER JOIN empresas emp ON (s1030.idempregador = emp.idempregador)
 WHERE s1030.cdrespostaprocessamento IN ('201','202')
   AND s1030.tipoambiente = 1
   AND s1030.codigocargo IS NOT NULL
   
UNION

SELECT DISTINCT 
	   emp.empresa,
	   (SELECT horario 
	      FROM horariosesocial h
	        WHERE h.codigoesocial = s1050.codigohorario
	   	AND h.idempregador = s1050.idempregador)::text codigo,
	   s1050.recibo, 
	   s1050.codigohorario matricula,
	   '',
       '',
	   '1050'
  FROM esocialevttabhortur s1050 INNER JOIN empresas emp ON (s1050.idempregador = emp.idempregador)
 WHERE s1050.cdrespostaprocessamento IN ('201','202')
   AND s1050.tipoambiente = 1
   AND s1050.codigohorario IS NOT NULL
   
UNION

SELECT s2200.empresa, 
       s2200.funcionario,
	   s2200.recibo,
	   (SELECT matriculaesocial 
	      FROM funcionarios f
		 WHERE f.empresa = s2200.empresa
		   AND f.funcionario = s2200.funcionario) matricula,
	   s2200.idempregador,
       '',
	   '2200'
  FROM esocialevtadmissao s2200
 WHERE cdrespostaprocessamento IN ('201','202')
   AND tipoambiente = 1
   
UNION

SELECT s2300.empresa, 
       s2300.funcionario,
	   s2300.recibo, 
	   (SELECT matriculaesocial 
	      FROM funcionarios f
		 WHERE f.empresa = s2300.empresa
		   AND f.funcionario = s2300.funcionario) matricula,
	   s2300.idempregador,
       '',
	   '2300'
  FROM esocialevttsvinicio s2300
 WHERE cdrespostaprocessamento IN ('201','202')
   AND tipoambiente = 1
   
UNION

SELECT empresa, 
       funcionario, 
	   recibo, 
	   (SELECT matriculaesocial 
	      FROM funcionarios f
		 WHERE f.empresa = s2206.empresa
		   AND f.funcionario = s2206.funcionario) matricula,
	   '',
	   to_char(dataenvio,'YYYY-MM-DD') data_alteracao,
	   '2206'
  FROM esocialevtaltcontratual AS s2206
 WHERE cdrespostaprocessamento IN ('201','202')
   AND tipoambiente = 1  
   
UNION

SELECT empresa, 
       funcionario, 
	   recibo, 
	   (SELECT matriculaesocial 
	      FROM funcionarios f
		 WHERE f.empresa = s2205.empresa
		   AND f.funcionario = s2205.funcionario) matricula,
	   '',
	   to_char(dataenvio,'YYYY-MM-DD') data_alteracao,
	   '2205'
  FROM esocialevtaltcontratual AS s2205
 WHERE cdrespostaprocessamento IN ('201','202')
   AND tipoambiente = 1