SELECT 
FROM tb_graduado g
WHERE EXISTS (SELECT *
              FROM tb_titulacao_empregado t
			  WHERE g.cpf = t.cpf AND t.ref_ies.codigo = 1);
			  