SELECT idtrabalhadoraso,
		 idtrabalhador,
		 idempresa,
		 dtaso,
		 fltipoaso,
		 flresultado,
		 dtvalidade,
		 nmmedico,
		 nrcrm,
		 flufcrm,
		 nrcpf
FROM dbo.tbtrabalhadoraso
order by 2, 3, 4