SELECT  GF_ParamEmpresa."IdEmpresa",
        (SELECT MAX(GF_CNAE."CodigoGoverno")
         FROM dbo.GF_CNAE
         WHERE GF_CNAE."IdCNAE" = GF_ParamEmpresa."IdCNAE") AS CNAE2,
        GF_ParamEmpresa."DtInicioAtividade",
        (SELECT MAX(GF_NatJuridica."CodigoGoverno")
         FROM dbo.GF_NatJuridica
         WHERE GF_NatJuridica."IdNaturezaJuridica" = GF_ParamEmpresa."IdNaturezaJuridica") AS NATJURIDICA,
        (SELECT MAX(GF_FPAS."CodigoGoverno")
         FROM dbo.GF_FPAS
         WHERE GF_FPAS."IdFPAS" = GF_ParamEmpresa."IdFPAS") AS IdFPAS,
	GF_ParamEmpresa."CodigoTerceiros",
        GF_ParamEmpresa."INSSEmpresa",
	GF_ParamEmpresa."INSSAcidTrabalho",
        GF_ParamEmpresa."INSSTerceiros",
        GF_ParamEmpresa."INSSAutonomos",
	GF_ParamEmpresa."IsencaoFilantropia",
        GF_ParamEmpresa."MesAnoReferencia",
	GF_ParamEmpresa."DtFimAtividade",
        GF_ParamEmpresa."SituacaoEmpresa",
        GF_ParamEmpresa."INSSSocios",
	GF_ParamEmpresa."MesDtBase",
	GF_ParamEmpresa."INSSFAP",
        GF_ParamEmpresa."TipoPeriodo",
        GF_ParamEmpresa."DtFimVigencia",
	GF_ParamEmpresa."DtInicioVigencia",
        (SELECT MAX(GF_PagamentoGPS."CodigoGoverno")
         FROM dbo.GF_PagamentoGPS
         WHERE GF_PagamentoGPS."IdPagamentoGPS" = GF_ParamEmpresa."IdPagamentoGPS") AS COD_GPS
FROM dbo.GF_ParamEmpresa
ORDER BY GF_ParamEmpresa."IdEmpresa", GF_ParamEmpresa."DtInicioVigencia" DESC
