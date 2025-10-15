SELECT DISTINCT P_CARGOS.*
FROM P_CARGOS
INNER JOIN p_trabalhadores 
	ON p_trabalhadores.tipo_cargo = P_CARGOS.TIPO_CARGO 
	and p_trabalhadores.cargo = P_CARGOS.cargo

UNION

SELECT DISTINCT P_CARGOS.*
FROM P_CARGOS
INNER JOIN p_trabalhadores_folhas 
	ON p_trabalhadores_folhas.tipo_cargo = P_CARGOS.TIPO_CARGO 
	and p_trabalhadores_folhas.cargo = P_CARGOS.cargo