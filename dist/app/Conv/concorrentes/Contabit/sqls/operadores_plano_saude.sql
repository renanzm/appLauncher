select * from tbpessoa 
where exists(select 1
				from dbo.tbtrabplanosaude
			   where tbtrabplanosaude.idpessoa = tbpessoa.idpessoa) order by 1