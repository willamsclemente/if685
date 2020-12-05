SELECT Proj
FROM (SELECT c.descricao AS Proj, COUNT (*) 
     FROM empregado A INNER JOIN participa b ON a.cpf = b.cpf INNER JOIN
          projeto c ON b.codigo_projeto = c.codigo
     GROUP BY c.descricao
     HAVING COUNT (*) > (SELECT AVG(QTD)
                         FROM (SELECT p.descricao, COUNT (*) AS QTD
                               FROM empregado e INNER JOIN participa pa ON e.cpf = pa.cpf INNER JOIN
                                    projeto p ON pa.codigo_projeto = p.codigo
                               GROUP BY p.descricao)));	 