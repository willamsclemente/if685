SELECT e.nome
FROM empregado e LEFT OUTER JOIN trabalha t 
     ON e.cpf = t.cpf WHERE t.cpf IS NULL
UNION (
       SELECT d.descricao
	   FROM trabalha t2 RIGHT OUTER JOIN departamento d
	   ON t2.codigo_depto = d.codigo WHERE t2.codigo_depto IS NULL);
	 
	 