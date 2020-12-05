SELECT e.nome
FROM empregado e
WHERE e.cpf_lider IS NULL AND e.cpf NOT IN (SELECT e1.cpf_lider
                                            FROM empregado e1);