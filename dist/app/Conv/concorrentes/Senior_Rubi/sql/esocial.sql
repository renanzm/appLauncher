DECLARE @retorno nvarchar(500)
DECLARE @query NVARCHAR(max)

SET @retorno = (Select top 1 TABLE_SCHEMA from INFORMATION_SCHEMA.TABLES)
set @query = concat('SELECT 
	empresa.numemp as codi_emp,
	'''' as codigo,
	empresa_social.numrec as recibo,
	'''' as codigoesocial,
	''1000'' as tipo_evento,
	'''' as data_tipo_rescisao,
	empresa_social.nrorec as recibo_vinculado
	FROM ', @retorno, '.R350EMP as empresa join ', @retorno, '.R350STA as empresa_social 
											on empresa_social.ideeve = empresa.ideeve 
	WHERE SUBSTRING(empresa_social.numrec, 1,4) = ''1.1.''
	
	union all

	SELECT
	  social.numemp as codi_emp,
	  LTRIM(RTRIM(
        SUBSTRING(
            desres,
            CHARINDEX(''Filial:'', desres) + LEN(''Filial:''),
            CASE
                WHEN CHARINDEX('','', desres, CHARINDEX(''Filial:'', desres)) > 0
                THEN CHARINDEX('','', desres, CHARINDEX(''Filial:'', desres))
                     - (CHARINDEX(''Filial:'', desres) + LEN(''Filial:''))
                ELSE LEN(desres)
            END
        )
      )) as codigo,
	  social.numrec as recibo,
	  LTRIM(RTRIM(
        SUBSTRING(
            desres,
            CHARINDEX(''Filial:'', desres) + LEN(''Filial:''),
            CASE
                WHEN CHARINDEX('','', desres, CHARINDEX(''Filial:'', desres)) > 0
                THEN CHARINDEX('','', desres, CHARINDEX(''Filial:'', desres))
                     - (CHARINDEX(''Filial:'', desres) + LEN(''Filial:''))
                ELSE LEN(desres)
            END
        )
      )) as codigoesocial,
	  right(social.layout, 4) as tipo_evento,
	  social.inival as data_tipo_rescisao,
	  social.nrorec as recibo_vinculado
	FROM
	  ', @retorno , '.R350STA as social
	WHERE
	  SUBSTRING(social.numrec, 1, 4) = ''1.1.''
	  AND social.layout in (''S-1005'', ''S-1020'')

	union all

	SELECT 
	cargo.numemp as codi_emp,
	convert(varchar(30), cargo.codcar) as codigo,
	cargo_social.numrec as recibo,
	cargo.idecar as codigoesocial,
	right(cargo_social.layout,4) as tipo_evento,
	'''' as data_tipo_rescisao,
	cargo_social.nrorec as recibo_vinculado
	FROM ', @retorno, '.R350CAR as cargo join ', @retorno , '.R350STA as cargo_social 
										on cargo_social.ideeve = cargo.ideeve
	WHERE SUBSTRING(cargo_social.numrec, 1,4) = ''1.1.'' 

	union all

	select 
	empregado.numemp as codi_emp,
	convert(varchar(30), empregado.numcad) as codigo,
	empregado_social.numrec as recibo,
	empregado.mattra as codigoesocial,
	right(empregado_social.layout,4) as tipo_evento,
	empregado_social.inival as data_tipo_rescisao,
	empregado.nrorec as recibo_vinculado
	from ', @retorno, '.R350ADM as empregado join ', @retorno, '.R350STA as empregado_social 
											on empregado_social.ideeve = empregado.ideeve
	WHERE SUBSTRING(empregado_social.numrec, 1,4) = ''1.1.''
	and empregado_social.layout in (''S-2200'')

	union all

	select distinct
	empregado_social.numemp as codi_emp,
	convert(varchar(30), empregado_social.numcad) as codigo,
	empregado_social.numrec as recibo,
	empregado.mattra as codigoesocial,
	right(empregado_social.layout,4) as tipo_evento,
	empregado_social.inival as data_tipo_rescisao,
	'''' as recibo_vinculado
	from ', @retorno, '.R350STA as empregado_social left join ', @retorno, '.R350ADM as empregado 
											on empregado.numcad = empregado_social.numcad
											and empregado.numemp = empregado_social.numemp
	WHERE SUBSTRING(empregado_social.numrec, 1,4) = ''1.1.''
	and empregado_social.layout in (''S-2205'',''S-2206'',''S-2230'')
	AND empregado_social.numrec IS NOT NULL
    AND empregado_social.numrec != ''''

	union all

	select 
	contribuinte.numemp as codi_emp,
	convert(varchar(30), contribuinte.numcad) as codigo,
	contribuinte.numrec as recibo,
	contribuinte_social.mateso as codigoesocial,
	right(contribuinte.layout,4) as tipo_evento,
	'''' as data_tipo_rescisao,
	contribuinte.nrorec as recibo_vinculado
	from ', @retorno, '.R030STA as contribuinte join ', @retorno, '.R034MAT as contribuinte_social 
												on contribuinte_social.numemp = contribuinte.numemp 
												and contribuinte_social.numcad = contribuinte.numcad
	WHERE SUBSTRING(contribuinte.numrec, 1,4) = ''1.1.''
	and contribuinte.layout = ''S-2300''

order by 1,5,2,3;')
exec(@query)