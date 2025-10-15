SELECT cd_empresa, esocial_grupo_empresa
FROM EBS_CORDILHEIRA.DBO.CRDEmpresaParametro
WHERE esocial_grupo_empresa IS NOT NULL
ORDER BY cd_empresa