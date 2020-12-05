SELECT nome
FROM empregado
WHERE (nome LIKE '%Cricano%') AND 
      (cpf_lider is NULL) AND
      (extract(year FROM dt_nasc) IN (1980,1982,1984,1986,1988)) AND
	  (sexo = 'F') AND
	  (salario BETWEEN 2000 AND 5000);