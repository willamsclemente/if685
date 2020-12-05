SELECT e.nome, d.descricao
FROM empregado e LEFT OUTER JOIN trabalha t ON e.cpf = t.cpf LEFT OUTER JOIN
     departamento d ON t.codigo_depto = d.codigo;
