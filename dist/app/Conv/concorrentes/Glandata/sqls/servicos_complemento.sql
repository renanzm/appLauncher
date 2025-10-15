SELECT empresa, fpas, terceiro, codigopagtogps
FROM empresacompetencias
WHERE to_number(empresacompetencias.competeinverte,'000000') = (SELECT MAX(to_number(comp.competeinverte,'000000'))
																FROM empresacompetencias as comp
																WHERE comp.empresa = empresacompetencias.empresa)
ORDER BY empresa
