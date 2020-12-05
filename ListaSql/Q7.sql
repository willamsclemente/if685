SELECT a.nome
FROM empregado a INNER JOIN trabalha t ON a.cpf = t.cpf INNER JOIN 
     departamento b ON b.codigo = t.codigo_depto
WHERE b.codigo = (SELECT d.codigo
                  FROM empregado e INNER JOIN departamento d ON e.cpf = d.cpf_chefe
                  WHERE e.nome = 'Fulano de Cicrano e Beltrano');
