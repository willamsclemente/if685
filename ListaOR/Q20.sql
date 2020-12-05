SELECT g.nome, g.cpf
FROM tb_graduado g, tb_titulacao_empregado t
WHERE g.cpf = t.cpf AND t.ref_grau.tipo = 'Administracao' AND
     (g.getIdade() > 25) AND t.ref_ies.sigla = 'FIFA';