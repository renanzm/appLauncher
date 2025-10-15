SELECT distinct IdGrupoEmpresa,
IdFuncionario,
MesAnoReferencia,
GF_Lancamento.IdVerba,
GF_Verba.Verba,
GF_Lancamento.Valor as TotalMedia,
GF_Verba.Indice,
(select max(base.tipoMedia)
   from GF_Base as base 
   join GF_Funcionario 
	 on GF_Funcionario.IdSindicato = base.IdSindicato
	and GF_Lancamento.IdVerba = base.IdVerba
	and GF_Funcionario.IdFuncionario = GF_CabecLancamento.IdFuncionario
	and GF_Funcionario.IdGrupoEmpresa = GF_CabecLancamento.IdGrupoEmpresa) as TipoMedia,
left(Referencia,8) as Referencia
  FROM GF_Lancamento
  JOIN GF_CabecLancamento
    ON GF_Lancamento.IdCabecLancto = GF_CabecLancamento.IdCabecLancto
  JOIN GF_Verba
	ON GF_Lancamento.IdVerba = GF_Verba.IdVerba
where year(GF_CabecLancamento.MesAnoReferencia) > 2020
and GF_CabecLancamento.TipoMovimento = 'ME'
and GF_CabecLancamento.Calculado = 1
and GF_Lancamento.valor <> 0
and exists (select 1
		FROM [dbo].GF_Base join GF_Funcionario on GF_Funcionario.IdSindicato = gf_base.IdSindicato
			where GF_Lancamento.IdVerba = gf_base.IdVerba
			and GF_Funcionario.IdFuncionario = GF_CabecLancamento.IdFuncionario
			and GF_Funcionario.IdGrupoEmpresa = GF_CabecLancamento.IdGrupoEmpresa)
ORDER BY 1,2,3