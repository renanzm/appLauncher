select tbcontracheque.idempresa,
		tbcontracheque.idtrabalhador,
		tbcontracheque.dtcalculo,
		tbcontrachequemedia.idrubricamedia,
		tbcontrachequemedia.vlreferenciamedia,
		tbcontrachequemedia.vlmedia
from dbo.tbcontracheque inner join dbo.tbcontrachequemedia
							 on tbcontrachequemedia.idempresa = tbcontracheque.idempresa
							 and tbcontrachequemedia.idcontracheque = tbcontracheque.idcontracheque
where year(tbcontracheque.dtcalculo) >= year(GETDATE()) - 3

UNION

select tbrubricacontracheque.idempresa,
       tbcontracheque.idtrabalhador,
       tbrubricacontracheque.dtcompetencia as dtcalculo,
	   tbrubricacontracheque.idrubrica as idrubricamedia,
	   tbrubricacontracheque.vlreferencia as vlreferenciamedia,
	   tbrubricacontracheque.vltotalrubrica as vlmedia
  from tbrubricacontracheque
inner join tbcontracheque
        on tbcontracheque.idempresa = tbrubricacontracheque.idempresa
	   and tbcontracheque.idcontracheque = tbrubricacontracheque.idcontracheque
where year(tbcontracheque.dtcalculo) >= year(GETDATE()) - 3
order by 1,2,3