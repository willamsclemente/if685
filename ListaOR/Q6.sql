SELECT p.nome 
FROM tb_graduado p
WHERE p.salario < (SELECT AVG(t.salario)
                   FROM tb_graduado t)
	AND EXISTS  
	              (SELECT *
				   FROM tb_trabalha t1
				   WHERE p.cpf = t1.ref_empregado.cpf AND t1.ref_depto.codigo = 1);

