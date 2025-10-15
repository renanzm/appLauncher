select p.*, i.cnpj, i.ddd, i.telefone, i.logradouro, i.bairro, i.cep,i.municipio, i.nome nomeins
  from persona.planossaude p, persona.instituicoes i
 where p.instituicao = i.instituicao