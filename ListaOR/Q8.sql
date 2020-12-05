SELECT d.ref_chefe.nome, d.codigo
FROM tb_departamento d
WHERE EXISTS (SELECT *
              FROM tb_trabalha t
			  WHERE d.ref_chefe.cpf = t.cpf AND t.codigo_depto <> d.codigo)
ORDER BY d.codigo;			  
			  