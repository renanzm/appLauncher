SELECT tbtpsetor.codigoempresa,
	   tbtpsetor.codsetor,
	   sat.data_alteracao,
	   tbtpsetor.descricao,
	   tbtpsetor.obrapropria,
	   tbtpsetor.nome,
	   tbtpsetor.cei,
	   tbtpsetor.endereco,
	   tbtpsetor.cep,
	   tbtpsetor.bairro,
	   tbtpsetor.fone,
	   tbtpsetor.codigomunicipioibge,
	   tbtpsetor.centrocusto,
	   tbtpsetor.tipodocumento,
	   tbtpsetor.custosdespesas,
	   tbtpsetor.codpagtogps,
	   tbtpsetor.codpagtogps_terceiros,
	   tbtpsetor.conta_cred_inss_empresa,
	   tbtpsetor.conta_dev_inss_empresa,
	   tbtpsetor.conta_cred_inss_terceiros,
	   tbtpsetor.conta_dev_inss_terceiros,
	   tbtpsetor.nomelogotipo,
	   tbtpsetor.datainicio,
	   tbtpsetor.datafinal,
	   tbtpsetor.email,
	   sat.aliquota_rat,
	   tbterc.id_tbfpas,
	   tbterc.codterceiros,
	   terceiros.inss_empresa,
	   tbtpsetor.codlotacao
FROM dpcuca.tbtpsetor
LEFT JOIN dpcuca.terceiros
ON tbtpsetor.codigoempresa = terceiros.codigo_empresa
LEFT JOIN dpcuca.tbterc
ON terceiros.id_tbterc = tbterc.id_tbterc
LEFT JOIN dpcuca.sat
ON tbtpsetor.codigoempresa = sat.codigoempresa
WHERE obrapropria in (2, 3)
ORDER BY codigoempresa, codsetor