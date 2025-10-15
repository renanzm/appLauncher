WITH Nacionalidade_CTE AS (
    SELECT IdNacionalidade, MAX(CodigoGoverno) AS NACIONALIDADE
    FROM dbo.GF_Nacionalidade
    GROUP BY IdNacionalidade
),
Naturalidade_CTE AS (
    SELECT C.IdCidade, MAX(C.Cidade) AS LOCAL_NASCIMENTO, MAX(U.Sigla) AS UF_NASCIMENTO
    FROM dbo.GF_Cidade C
    JOIN dbo.GF_UF U ON C.IdUF = U.IdUF
    GROUP BY C.IdCidade
),
Endereco_CTE AS (
    SELECT C.IdCidade, MAX(C.Cidade) AS CIDADE, MAX(U.Sigla) AS ESTADO
    FROM dbo.GF_Cidade C
    JOIN dbo.GF_UF U ON C.IdUF = U.IdUF
    GROUP BY C.IdCidade
),
UF_CTE AS (
    SELECT IdUF, MAX(Sigla) AS Sigla
    FROM dbo.GF_UF
    GROUP BY IdUF
),
Ultimo_Evento_s2200_CTE AS (
    SELECT s1.*
    FROM dbo.GF_ES_s2200 s1
    JOIN (
        SELECT IdFuncionario, MAX(IdMonitorEventoDetalhe) AS MaxId
        FROM dbo.GF_ES_s2200
        GROUP BY IdFuncionario
    ) s2 ON s1.IdFuncionario = s2.IdFuncionario AND s1.IdMonitorEventoDetalhe = s2.MaxId
),
Ferias_CTE AS (
    SELECT f.IdGrupoEmpresa, f.IdFuncionario, MAX(f.DtFimAquisicao) AS DtFimAquisicao
    FROM dbo.GF_Ferias f
    WHERE f.DtFimAquisicao = (
        SELECT MAX(DtFimAquisicao)
        FROM dbo.GF_Ferias f2
        WHERE f2.IdGrupoEmpresa = f.IdGrupoEmpresa
          AND f2.IdFuncionario = f.IdFuncionario
    )
    GROUP BY f.IdGrupoEmpresa, f.IdFuncionario
)

SELECT 
       GF_Funcionario.IdGrupoEmpresa,
       GF_Funcionario.IdFuncionario,
       GF_Funcionario.DtInicioVigencia,
       GF_Funcionario.IdEmpresa,
       GF_Funcionario.Nome,
       GF_Funcionario.DtNascimento,
       N.NACIONALIDADE,
       GF_Funcionario.AnoChegada,
       NAT.LOCAL_NASCIMENTO,
       NAT.UF_NASCIMENTO,
       GF_Funcionario.IdSexo,
       GF_Funcionario.IdEstadoCivil,
       GF_Funcionario.IdRacaCor,
       GF_Funcionario.IdGrauInstrucao,
       GF_Funcionario.NomePai,
       GF_Funcionario.NomeMae,
       GF_Funcionario.Logradouro,
       GF_Funcionario.Numero,
       GF_Funcionario.TipoContrato,
       GF_Funcionario.Complemento,
       GF_Funcionario.Bairro,
       ENDERECO.CIDADE,
       ENDERECO.ESTADO,
       GF_Funcionario.CEP,
       GF_Funcionario.DDDTelResidencial,
       GF_Funcionario.TelResidencial,
       GF_Funcionario.DDDCelular,
       GF_Funcionario.Celular,
       GF_Funcionario.Email,
       GF_Funcionario.RG,
       GF_Funcionario.OrgaoEmissorRG,
       UF_RG.Sigla AS UF_EXP_IDENT,
       GF_Funcionario.DtEmissaoRG,
       GF_Funcionario.CPF,
       GF_Funcionario.CarteiraTrabalho,
       GF_Funcionario.SerieCartTrabalho,
       UF_CT.Sigla AS UF_CART_PROF,
       GF_Funcionario.DtCartTrabalho,
       GF_Funcionario.TituloEleitor,
       GF_Funcionario.ZonaTituloEleitor,
       GF_Funcionario.SecaoTituloEleitor,
       GF_Funcionario.CertReservista,
       GF_Funcionario.CategoriaMilitar,
       GF_Funcionario.CartHabilitacao,
       GF_Funcionario.CategoriaCH,
       GF_Funcionario.DtVencimentoCH,
       GF_Funcionario.PISPASEP,
       GF_Funcionario.DtPISPASEP,
       GF_Funcionario.InscricaoINSS,
       GF_Funcionario.DtAdmissao,
       GF_Funcionario.IdCategoria,
       GF_Funcionario.IdTipoSalario,
       GF_Funcionario.PercAdiantamento,
       GF_Funcionario.NaoRecebeAdiantamento,
       GF_Funcionario.Salario,
       GF_Funcionario.AlvaraJudicial,
       GF_Funcionario.DiasContrExp,
       GF_Funcionario.DiasProrrogacaoCE,
       GF_Funcionario.OptanteFGTS,
       GF_Funcionario.DtOpcaoFGTS,
       GF_Funcionario.IdEscala,
       GF_Funcionario.IdHorario,
       GF_Funcionario.JornadaMensal,
       GF_Funcionario.JornadaSemanal,
       GF_Funcionario.JornadaDiaria,
       GF_Funcionario.IdDepartamento,
       GF_Funcionario.IdSecao,
       GF_Funcionario.IdCentroCusto,
       GF_Funcionario.IdTomador,
       GF_Funcionario.IdCargo,
       GF_Funcionario.IdSindicato,
       GF_Funcionario.DescContrSindical,
       GF_Funcionario.IdExposicaoTrab,
       GF_Funcionario.DtUltimoExame,
       GF_Funcionario.IdBanco,
       GF_Funcionario.ContaCorrente,
       GF_Funcionario.TipoConta,
       GF_Funcionario.ContaFGTS,
       GF_Funcionario.DtRescisao,
       GF_Funcionario.IdDeficiencia,
       GF_Funcionario.DtTransferencia,
       GF_Funcionario.DVContaCorrente,
       GF_Funcionario.PaisOrigem,
       GF_Funcionario.DataChegada,
       GF_Funcionario.NumPassaporte,
       GF_Funcionario.EmissorPassaporte,
       GF_Funcionario.UfPassaporte,
       GF_Funcionario.DtEmissaoPassaporte,
       GF_Funcionario.DtValidadePassaporte,
       GF_Funcionario.PaisPassaporte,
       GF_Funcionario.NumNaturalizacao,
       GF_Funcionario.DtNaturalizacao,
       GF_Funcionario.TipoEndereco,
       GF_Funcionario.CaixaPostal,
       GF_Funcionario.NumRic,
       GF_Funcionario.UfRic,
       GF_Funcionario.OrgaoEmissorRic,
       GF_Funcionario.MuniciopioRic,
       GF_Funcionario.DtExpedicaoRic,
       GF_Funcionario.idIES,
       GF_Funcionario.idFuncionarioTutor,
       GF_Funcionario.codNivelEscolar,
       GF_Funcionario.NaturezaEstagio,
       GF_Funcionario.AreaAtuacaoEstagio,
       GF_Funcionario.modalidadeEstagio,
       GF_Funcionario.NumApoliceSeguroEstagio,
       GF_Funcionario.IdCategoriaTrabalhador,
       GF_Funcionario.indicativoAdmissao,
       GF_Funcionario.InscricaoEmpresaAnterior,
       S2200.matricula,
       S2200.codcateg,
       F.DtFimAquisicao
FROM dbo.GF_Funcionario
LEFT JOIN Nacionalidade_CTE N ON N.IdNacionalidade = GF_Funcionario.IdNacionalidade
LEFT JOIN Naturalidade_CTE NAT ON NAT.IdCidade = GF_Funcionario.IdNaturalidade
LEFT JOIN Endereco_CTE ENDERECO ON ENDERECO.IdCidade = GF_Funcionario.IdCidade
LEFT JOIN UF_CTE UF_RG ON UF_RG.IdUF = GF_Funcionario.IdUFRG
LEFT JOIN UF_CTE UF_CT ON UF_CT.IdUF = GF_Funcionario.IdUFCartTrabalho
LEFT JOIN UF_CTE UF_PASS ON UF_PASS.IdUF = GF_Funcionario.UfPassaporte
LEFT JOIN UF_CTE UF_RIC ON UF_RIC.IdUF = GF_Funcionario.UfRic
LEFT JOIN Ultimo_Evento_s2200_CTE S2200 ON S2200.IdFuncionario = GF_Funcionario.IdFuncionario
LEFT JOIN Ferias_CTE F ON F.IdGrupoEmpresa = GF_Funcionario.IdGrupoEmpresa AND F.IdFuncionario = GF_Funcionario.IdFuncionario
WHERE GF_Funcionario.DtInicioVigencia = (
    SELECT MAX(SUB.DtInicioVigencia)
    FROM dbo.GF_Funcionario SUB
    WHERE SUB.IdFuncionario = GF_Funcionario.IdFuncionario
      AND SUB.IdEmpresa = GF_Funcionario.IdEmpresa
)
ORDER BY GF_Funcionario.IdEmpresa,
         GF_Funcionario.IdFuncionario,
         GF_Funcionario.DtInicioVigencia DESC
