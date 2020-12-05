CREATE VIEW empTitulacao AS
SELECT g.nome
FROM tb_graduado g, tb_titulacao_empregado t
WHERE g.cpf = t.cpf
GROUP BY g.nome
HAVING COUNT(*) > 1;

SELECT *
FROM empTitulacao;

