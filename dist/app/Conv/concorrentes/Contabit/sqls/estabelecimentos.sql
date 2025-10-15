select distinct tbempresa.idempresa,
       tbestabelecimento.idestabelecimento,
       tbestabelecimento.dtinicio,
       tbempresadetalhe.nmempresa,
	   (select nrcnpjcpf
	      from tbempresa
		 where tbempresa.idempresa = tblotacao.idestabelecimento) as nrcnpjcpf,
       tbempresa.nriestadual,
       tbempresa.nrimunicipal,
       tbempresa.nrcno,
       tbempresa.flpat,
       tbempresa.nrregistro,
       tbempresa.nmorgaoregistro,
       tbempresa.dtregistro,
       tbempresa.nmfantasia,
       tbempresa.fllogradouro,
       tbempresa.dslogradouro,
       tbempresa.dscplogradouro,
       tbempresa.nrlogradouro,
       tbempresa.nmbairro,
       tbempresa.nmcidade,
       tbempresa.cdibgecidade,
       tbempresa.nrcep,
       tbempresa.fluf,
       tbempresa.nrtelefonefixo,
       tbempresa.nrtelefonecelular,
       tbempresa.nmhomepage,
       tbempresa.nmemail,
       tbempresa.flstatusesocials1000,
       tbempresa.flstatusesocials1005,
       tbempresa.idempresaimportarubricas,
       tblotacaodetalhe.cdfpas,
       cdcnae,
       txfap,
       txrat
from dbo.tbempresadetalhe
inner join dbo.tbempresa
       on tbempresa.idempresa = tbempresadetalhe.idempresa
inner join dbo.tblotacao
       on tblotacao.idempresa = tbempresa.idempresa
inner join dbo.tbestabelecimento
       on tbestabelecimento.idestabelecimento = tblotacao.idestabelecimento
inner join dbo.tblotacaodetalhe
       on tblotacaodetalhe.idempresa = tblotacao.idempresa
      and tblotacaodetalhe.idlotacao = tblotacao.idlotacao
      and tblotacaodetalhe.idestabelecimento = tblotacao.idestabelecimento
      and tblotacaodetalhe.dtinicio = (
          select top (1) sub.dtinicio
          from dbo.tblotacaodetalhe as sub
          where sub.idempresa = tblotacaodetalhe.idempresa
            and sub.idlotacao = tblotacaodetalhe.idlotacao
            and sub.idestabelecimento = tblotacaodetalhe.idestabelecimento
          order by sub.dtinicio desc
      )
where tbempresadetalhe.dtinicio = (
    select top (1) sub.dtinicio
    from dbo.tbempresadetalhe as sub
    where sub.idempresa = tbempresadetalhe.idempresa
    order by sub.dtinicio desc
)
order by tbempresa.idempresa, tbestabelecimento.idestabelecimento