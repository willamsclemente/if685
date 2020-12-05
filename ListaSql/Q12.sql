SELECT b.nome
FROM empregado b
WHERE NOT EXISTS 
               (SELECT DISTINCT *
                FROM empregado e
				WHERE b.cpf = e.cpf_lider);
