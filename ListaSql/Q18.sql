SELECT Proj, S, COUNT (*)
FROM (SELECT DISTINCT p.descricao AS Proj, e.nome, e.sexo AS S
      FROM empregado e INNER JOIN participa pa ON e.cpf = pa.cpf INNER JOIN
      projeto p ON pa.codigo_projeto = p.codigo)
GROUP BY Proj, S;