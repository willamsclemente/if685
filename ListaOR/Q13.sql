DELETE
FROM tb_trabalha t
WHERE t.codigo_depto = 1;

SELECT g.nome, g.cpf, t.ref_depto.codigo AS codigo
FROM tb_graduado g, tb_trabalha t
WHERE g.cpf = t.cpf AND t.ref_depto IS NOT DANGLING;