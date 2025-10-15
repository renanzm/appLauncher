select * 
  from contador_dados left outer join entidade
                                   on substring(contador_dados.chv_enti,6) = entidade.chv_enti
					  left outer join endereco
                                   on contador_dados.chv_enti = endereco.chv_enti
					  left outer join email
                                   on entidade.chv_enti = email.chv_enti
order by codigo