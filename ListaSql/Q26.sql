SELECT p.descricao, e.nome,
FROM empregado e INNER JOIN participa pa ON e.cpf = pa.cpf INNER JOIN
     projeto p ON p.codigo = pa.codigo_projeto;
WHERE EXISTS (SELECT 
              FROM empregado e1 INNER JOIN participa pa1 ON e1.cpf = pa1.cpf
			  WHERE