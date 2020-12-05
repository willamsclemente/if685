SELECT e.nome
FROM empregado e INNER JOIN trabalha t ON e.cpf = t.cpf
WHERE e.salario > (SELECT AVG(e3.salario)
                   FROM (SELECT t3.cpf AS cpfB, t3.codigo_depto AS codB, t3.data_trabalha AS dataB
                         FROM (SELECT e2.cpf AS cpfA, MAX(t2.data_trabalha) AS datatual 
                               FROM empregado e2 INNER JOIN trabalha t2 ON e2.cpf = t2.cpf
                               GROUP BY e2.cpf), trabalha t3
                         WHERE cpfA = t3.cpf AND datatual = t3.data_trabalha), empregado e3
                   WHERE e3.cpf = cpfB AND codB = t.codigo_depto)
				   AND
				   t.data_trabalha = (SELECT MAX(t4.data_trabalha)
				                      FROM trabalha t4 
									  WHERE e.cpf = t4.cpf);
									
	  
