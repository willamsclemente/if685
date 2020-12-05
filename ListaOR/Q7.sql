SELECT DISTINCT (DEREF(t.ref_empregado)) AS funcionario
FROM tb_participa t
WHERE t.ref_atividade.codigo = 2 AND t.ref_projeto.valor > (SELECT AVG(t1.valor)
                                                             FROM tb_projeto t1);
