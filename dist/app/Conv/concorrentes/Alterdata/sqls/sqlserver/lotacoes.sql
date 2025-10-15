SELECT DISTINCT
    lotacao.*,
    fpas.*,
    emp.NrCGC,
    emp.DtInicioAtividade,
    emp.cdCNAE,
    emp.DsEndereco,
    emp.NmBairro,
    emp.NmCidade,
    emp.CdUF,
    emp.NrCEP,
    emp.NrTelefone,
    esocial.VIGENCIA
FROM wdp.lotacao_tributaria AS lotacao
LEFT JOIN wdp.fpas AS fpas 
    ON fpas.IdFPAS = lotacao.Fpas_Id
LEFT JOIN wphd.empresa AS emp 
    ON emp.CdEmpresa = lotacao.Empresa_Id
LEFT JOIN wdp.ESOCIAL_FILA AS esocial
    ON esocial.EMPRESA_ID = lotacao.Empresa_Id
       AND SUBSTRING(
           esocial.DESCRICAO,
           CHARINDEX('Lot: ', esocial.DESCRICAO) + 5,
           LEN(esocial.DESCRICAO)
       ) = lotacao.Descricao
WHERE 
    esocial.REGISTRO IN ('S-1020')
    AND esocial.RECIBO <> ''
    AND esocial.AMBIENTE = 1
ORDER BY 3, 2;
