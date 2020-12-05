SELECT DISTINCT e1.nome
FROM  empregado e1 INNER JOIN participa pa1 ON e1.cpf = pa1.cpf INNER JOIN
      projeto p1 ON pa1.codigo_projeto = p1.codigo
WHERE p1.codigo in  
                  (SELECT p.codigo
                   FROM empregado e INNER JOIN participa pa ON e.cpf = pa.cpf INNER JOIN
                        projeto p ON pa.codigo_projeto = p.codigo
                   WHERE e.nome = 'Fulano de Cicrano e Beltrano')
      AND
	  EXTRACT(MONTH FROM e1.dt_nasc) = 
                   (SELECT EXTRACT(MONTH FROM e2.dt_nasc)
                     FROM empregado e2 
                     WHERE e2.nome = 'Fulano de Cicrano e Beltrano')
	  AND
	  e1.cpf <> (SELECT e3.cpf 
                 FROM empregado e3 
                 WHERE e3.nome = 'Fulano de Cicrano e Beltrano');
	  
					 
