SELECT d.descricao, e.nome, CASE 
                                WHEN (EXTRACT(YEAR FROM TRUNC(SYSDATE)) - EXTRACT(YEAR FROM e.dt_nasc)) > 40 THEN 'muito experiente'
	                            WHEN (EXTRACT(YEAR FROM TRUNC(SYSDATE)) - EXTRACT(YEAR FROM e.dt_nasc)) BETWEEN 30 AND 40 THEN 'experiente'
	                            ELSE 'pouco experiente'
                            END AS EXPERIENCIA
FROM empregado e, departamento d, trabalha t
WHERE e.cpf = t.cpf AND d.codigo = t.codigo_depto;


 
	
	