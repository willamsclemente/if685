SELECT b.nome, a.descricao
FROM  empregado b INNER JOIN trabalha i ON b.cpf = i.cpf INNER JOIN 
      departamento a ON a.codigo = i.codigo_depto
WHERE (b.cpf, i.data_trabalha) IN (SELECT e.cpf, MAX(t.data_trabalha)
                                  FROM empregado e INNER JOIN trabalha t ON e.cpf = t.cpf INNER JOIN 
                                  departamento d ON d.codigo = t.codigo_depto
                                  GROUP BY e.cpf);