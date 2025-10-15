select endereco.*, UPPER(titulo.nome) tipo_rua
from ger_empresa_endereco endereco
inner join ger_cep_titulo titulo ON endereco.id_ger_cep_titulo = titulo.id