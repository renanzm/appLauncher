SELECT ger_empresa.codigo,mfp_empresa.* FROM mfp_empresa
INNER JOIN ger_empresa ON ger_empresa.id = mfp_empresa.id_ger_empresa
WHERE referencia = (SELECT MAX(referencia)
                      FROM mfp_empresa as SUB
                    WHERE SUB.id = mfp_empresa.id)
ORDER BY 1