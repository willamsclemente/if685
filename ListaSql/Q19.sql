SELECT Proj
FROM (SELECT Proj, S, COUNT (*)
     FROM (SELECT DISTINCT p.descricao AS Proj, e.nome, e.sexo AS S
           FROM empregado e INNER JOIN participa pa ON e.cpf = pa.cpf INNER JOIN
           projeto p ON pa.codigo_projeto = p.codigo)
     WHERE S = 'F'	   
     GROUP BY Proj, S
     HAVING COUNT (*) >(SELECT QTD
                        FROM (SELECT Proj1, S1, COUNT (*) AS QTD
                              FROM (SELECT DISTINCT h.descricao AS Proj1, t.nome, t.sexo AS S1
                                    FROM empregado t INNER JOIN participa x ON t.cpf = x.cpf INNER JOIN
                                    projeto h ON x.codigo_projeto = h.codigo)
                              GROUP BY Proj1, S1)
				        WHERE S1 = 'M' AND Proj1 = Proj));