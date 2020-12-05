SELECT nome, descricao
FROM empregado e INNER JOIN trabalha t ON e.cpf = t.cpf INNER JOIN 
     departamento d ON t.codigo_depto = d.codigo;	 