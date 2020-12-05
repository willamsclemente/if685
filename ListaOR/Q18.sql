SELECT g.nome, p.ref_projeto.descricao
FROM tb_graduado g, tb_participa p
WHERE g.cpf = p.cpf AND p.ref_atividade.descricao = 'Atividade 1';