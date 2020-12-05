SELECT e.nome
FROM empregado e
WHERE e.cpf_lider IS NOT NULL AND e.cpf IN (SELECT e1.cpf_lider
                                            FROM empregado e1);