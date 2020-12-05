SELECT e.nome, d.descricao
FROM empregado e FULL OUTER JOIN trabalha t ON e.cpf = t.cpf FULL OUTER JOIN
     departamento d ON t.codigo_depto = d.codigo;