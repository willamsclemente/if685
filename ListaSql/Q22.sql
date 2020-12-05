SELECT b.nome, b.salario - (SELECT AVG (c.salario) FROM empregado c) AS DIF
FROM empregado B
WHERE b.salario > (SELECT AVG (e.salario)
                   FROM empregado e);
