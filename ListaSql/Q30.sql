SELECT e.nome
FROM empregado e
WHERE NOT EXISTS ((SELECT p.codigo
				    FROM projeto p)
                   MINUS
                   (SELECT DISTINCT pa.codigo_projeto
                   FROM participa pa
				   WHERE e.cpf = pa.cpf));
				 
				 
	  