select pt.*, pd.*, pd.datasaida datasaidadep
  from persona.planossaudetrabalhadores pt left join
  	   persona.planossaudedependentestrabalhadores pd on 
	   (pt.planosaudetrabalhador = pd.planosaudetrabalhador)
 order by pt.planosaudetrabalhador