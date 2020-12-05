SELECT e.nome
FROM empregado e
WHERE EXISTS
            (SELECT *
             FROM departamento d
             WHERE d.cpf_chefe = e.cpf);