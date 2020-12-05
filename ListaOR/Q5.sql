SELECT t.ref_depto.ref_chefe.nome
FROM tb_trabalha t
WHERE t.ref_gratificacao.codigo = 3
GROUP BY t.ref_depto.ref_chefe.nome
HAVING COUNT(*) > 1;