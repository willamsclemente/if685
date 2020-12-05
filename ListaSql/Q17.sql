SELECT e.nome, p.descricao, COUNT (*)
FROM empregado e INNER JOIN participa pa ON e.cpf = pa.cpf INNER JOIN
     projeto p ON p.codigo = pa.codigo_projeto INNER JOIN
	 atividade a ON a.codigo = pa.codigo_atividade
GROUP BY e.nome, p.descricao;