SELECT t.ref_graduado.nome
FROM tb_titulacao_empregado t
WHERE t.ref_graduado.sexo = 'M' AND t.ref_graduado.salario > 
                                    (SELECT AVG(t1.ref_graduado.salario)
									 FROM tb_titulacao_empregado t1);