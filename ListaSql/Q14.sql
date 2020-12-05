SELECT e.nome
FROM empregado e
WHERE NOT EXISTS 
                 (SELECT *
                  FROM departamento d
                  WHERE e.cpf = d.cpf_chefe);