SELECT [eSocial_Export_Prot_Evento].[Evento],
       [eSocial_Export_Prot_Evento].[Numero_Recibo],
       [eSocial_Export_Prot_Evento].[Identificacao],
	   [eSocial_Export_Prot].[Cod_Empresa]
FROM [PRIMARIOS].[dbo].[eSocial_Export_Prot_Evento]
INNER JOIN [PRIMARIOS].[dbo].[eSocial_Export_Prot]
    ON ([eSocial_Export_Prot_Evento].[id_Export_Prot] = [eSocial_Export_Prot].[id_Export_Prot])
 WHERE [eSocial_Export_Prot_Evento].[Numero_Recibo] <> '' 
   and LEFT([eSocial_Export_Prot_Evento].[Numero_Recibo],3) <> '1.2'
   and [eSocial_Export_Prot_Evento].[Evento] IN ('S1000','S1030','S2200')