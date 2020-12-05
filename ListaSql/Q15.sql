SELECT b.nome
FROM empregado b
WHERE b.cpf in  (SELECT DISTINCT e.cpf_lider
                 FROM empregado e);