select idempresa,
        idlotacao,
        idtrabalhador,
        dtiniciolotacao,
        dtfinallotacao,
        idtrabtransfestabelecimento
from dbo.tbtrabalhadorlotacao

order by 1, 3, 4