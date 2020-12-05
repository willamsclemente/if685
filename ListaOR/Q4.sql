SELECT p.ref_empregado.nome
FROM tb_participa p
WHERE p.ref_atividade.codigo = 2 AND (p.ref_empregado.cpf IN (SELECT d.ref_chefe.cpf
                                                              FROM tb_departamento d));
