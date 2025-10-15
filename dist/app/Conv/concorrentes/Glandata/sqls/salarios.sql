SELECT empresa, 
	   funcionario, 
	   tiposalario, 
	   valorsalario, 
	   horassemanais, 
	   horasmensais, 
       horario
	   
  FROM funcionariossalarios
  WHERE to_number(funcionariossalarios.competeinverte,'000000') = (SELECT MAX(to_number(func2.competeinverte,'000000'))
								       FROM funcionariossalarios AS func2
				                                       WHERE func2.empresa = funcionariossalarios.empresa AND
				                                       func2.funcionario = funcionariossalarios.funcionario)
ORDER BY empresa, funcionario
