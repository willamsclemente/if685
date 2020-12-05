SELECT e.nome
FROM empregado e
WHERE cpf_lider = (SELECT s.cpf
                   FROM empregado s
				   WHERE nome = 'Fulano de Cicrano e Beltrano Jr.');