DECLARE @retorno varchar(500)
DECLARE @query VARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT 
    empregados.*, 
    empreg_compl.*, 
    cidades.nomcid AS nomcid_endereco, 
    cidades.estcid AS estcid_endereco, 
    bairros.nombai AS bairro_endereco, 
    cidades_nasc.nomcid AS nomcid_nasc,
    cidades_nasc.estcid AS estcid_nasc,
	cidade_ric.nomcid AS nomcid_ric,
	cidade_ric.estcid AS estcid_ric,
	estagio.datref AS estagio_datref,
	estagio.natetg AS estagio_natetg,
	estagio.nivetg AS estagio_nivetg,
	estagio.areatu AS estagio_areatu,
	estagio.aposeg AS estagio_aposeg,
	estagio.valbol AS estagio_valbol,
	estagio.preter AS estagio_preter,
	estagio.insens AS estagio_insens,
	estagio.ageint AS estagio_ageint,
	estagio.empcoo AS estagio_empcoo,
	estagio.tipcoo AS estagio_tipcoo,
	estagio.numcoo AS estagio_numcoo,
	estagio.nomcoo AS estagio_nomcoo,
	estagio.cpfcoo AS estagio_cpfcoo,
	cedido_1.cnpjan,
	cedido_1.catant,
	cedido_1.admant,
	cedido_1.matant,
	cedido_2.regtra,
	cedido_2.regpre,
	cedido_2.remcar,
    (SELECT MIN(t1.valsal)
     FROM ', @retorno, '.R038HSA AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol
       AND t1.datalt <= (SELECT MIN(t2.datalt)
                         FROM ', @retorno, '.R038HSA AS t2
                         WHERE t2.numemp = t1.numemp
                           AND t2.numcad = t1.numcad
                           AND t2.tipcol = t1.tipcol)) AS salario,
    (SELECT MIN(t1.codsin)
     FROM ', @retorno, '.R038HSI AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol
       AND t1.datalt <= (SELECT MIN(t2.datalt)
                         FROM ', @retorno, '.R038HSI AS t2
                         WHERE t2.numemp = t1.numemp
                           AND t2.numcad = t1.numcad
                           AND t1.tipcol = t2.tipcol
                           AND t2.codsin <> 0)) AS sindicato,
    (SELECT MIN(t1.numloc)
     FROM ', @retorno, '.R038HLO AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol
       AND t1.datalt <= (SELECT MIN(t2.datalt)
                         FROM ', @retorno, '.R038HLO AS t2
                         WHERE t2.numemp = t1.numemp
                           AND t2.numcad = t1.numcad
                           AND t2.tipcol = t1.tipcol)) AS depto,
    (SELECT MIN(t1.codcar)
     FROM ', @retorno, '.R038HCA AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol
       AND t1.datalt = (SELECT MIN(t2.datalt)
                         FROM ', @retorno, '.R038HCA AS t2
                         WHERE t2.numemp = t1.numemp
                           AND t2.numcad = t1.numcad
                           AND t2.tipcol = t1.tipcol)) AS cargo,
    (SELECT MIN(t1.codfil)
     FROM ', @retorno, '.R038HFI AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol
       AND t1.datalt <= (SELECT MIN(t2.datalt)
                         FROM ', @retorno, '.R038HFI AS t2
                         WHERE t2.numemp = t1.numemp
                           AND t2.numcad = t1.numcad
                           AND t2.tipcol = t1.tipcol)) AS servico,
    (SELECT MIN(t1.codesc)
     FROM ', @retorno, '.R038HES AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol
       AND t1.datalt <= (SELECT MIN(t2.datalt)
                         FROM ', @retorno, '.R038HES AS t2
                         WHERE t2.numemp = t1.numemp
                           AND t2.numcad = t1.numcad
                           AND t2.tipcol = t1.tipcol)) AS jornada,
    (SELECT MIN(t1.codccu)
     FROM ', @retorno, '.R038HCC AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol
       AND t1.datalt <= (SELECT MIN(t2.datalt)
                         FROM ', @retorno, '.R038HCC AS t2
                         WHERE t2.numemp = t1.numemp
                           AND t2.numcad = t1.numcad
                           AND t2.datalt = t1.datalt
                           AND t1.tipcol = t2.tipcol)) AS ccustos,
    (SELECT MAX(t1.mattra)
     FROM ', @retorno, '.R350ADM AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol) AS codigo_esocial,
    (SELECT MAX(t1.nompai)
     FROM ', @retorno, '.R350ADM AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol) AS nompai,
    (SELECT MAX(t1.nommae)
     FROM ', @retorno, '.R350ADM AS t1
     WHERE t1.numemp = empregados.numemp
       AND t1.numcad = empregados.numcad
       AND t1.tipcol = empregados.tipcol) AS nommae
FROM ', @retorno, '.R034FUN AS empregados
LEFT JOIN ', @retorno, '.R034CPL AS empreg_compl
    ON empregados.numemp = empreg_compl.numemp
    AND empregados.numcad = empreg_compl.numcad
    AND empregados.tipcol = empreg_compl.tipcol
LEFT JOIN ', @retorno, '.R034ADM AS cedido_1
    ON empregados.numemp = cedido_1.numemp
    AND empregados.numcad = cedido_1.numcad
    AND empregados.tipcol = cedido_1.tipcol
	AND cedido_1.datadm <= (SELECT MAX(t2.datadm)
                         FROM ', @retorno, '.R034ADM AS t2
                         WHERE t2.numemp = cedido_1.numemp
                           AND t2.numcad = cedido_1.numcad
                           AND t2.tipcol = cedido_1.tipcol)
LEFT JOIN ', @retorno, '.r038HPU AS cedido_2
    ON empregados.numemp = cedido_2.numemp
    AND empregados.numcad = cedido_2.numcad
    AND empregados.tipcol = cedido_2.tipcol
	AND cedido_2.datalt <= (SELECT MAX(t2.datalt)
                         FROM ', @retorno, '.r038HPU AS t2
                         WHERE t2.numemp = cedido_2.numemp
                           AND t2.numcad = cedido_2.numcad
                           AND t2.tipcol = cedido_2.tipcol)
LEFT JOIN ', @retorno, '.R074CID AS cidades 
    ON empreg_compl.codcid = cidades.codcid
LEFT JOIN ', @retorno, '.R074BAI AS bairros 
    ON empreg_compl.codcid = bairros.codcid 
    AND empreg_compl.codbai = bairros.codbai
LEFT JOIN ', @retorno, '.R074CID AS cidades_nasc 
    ON empreg_compl.ccinas = cidades_nasc.codcid
LEFT JOIN ', @retorno, '.R074CID AS cidade_ric
    ON empreg_compl.cidric = cidade_ric.codcid
LEFT JOIN ', @retorno, '.R034ETG AS estagio
    ON empregados.numemp = estagio.numemp
    AND empregados.numcad = estagio.numcad
    AND empregados.tipcol = estagio.tipcol
ORDER BY empregados.NUMEMP, empregados.TIPCOL, empregados.NUMCAD;')
exec(@query)
