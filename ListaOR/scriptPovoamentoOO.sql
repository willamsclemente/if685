--inserindo Projetos (3 no total)
INSERT INTO tb_projeto VALUES (1, 'Projeto 1', 5000.00);
INSERT INTO tb_projeto VALUES (2, 'Projeto 2', 9600.00);
INSERT INTO tb_projeto VALUES (3, 'Projeto 3', 7500.00);

--inserindo Atividades (5 no total)
INSERT INTO tb_atividade VALUES (1, 'Atividade 1');
INSERT INTO tb_atividade VALUES (2, 'Atividade 2');
INSERT INTO tb_atividade VALUES (3, 'Atividade 3');
INSERT INTO tb_atividade VALUES (4, 'Atividade 4');
INSERT INTO tb_atividade VALUES (5, 'Atividade 5');

--inserindo Empregados (7 no total, entre Técnicos e Graduados)
INSERT INTO tb_graduado VALUES (
	1111, 
	'Joao da Silva', 
	to_date ('21/02/1980', 'dd/mm/yyyy'), 
	'M', 
	5000.00, 
	tp_nt_fone('9487-0975', '3785-0946'),
	tp_endereco(111111, 'Rua 01'),
	NULL
);
INSERT INTO tb_graduado VALUES (
	2222, 
	'Marco Aurelio', 
	to_date ('15/05/1987', 'dd/mm/yyyy'), 
	'M', 
	3500.00,
	tp_nt_fone('3245-0536'),
	tp_endereco(122221, 'Rua 02'),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111)
);
INSERT INTO tb_tecnico VALUES (
	3333, 
	'Josefa Paes', 
	to_date ('23/11/1990', 'dd/mm/yyyy'), 
	'F', 
	4000.00,
	tp_nt_fone('3333-6554'),
	tp_endereco(133313, 'Rua 03'),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111),
	12
);
INSERT INTO tb_tecnico VALUES (
	4444, 
	'Dario Marques', 
	to_date ('05/06/1992', 'dd/mm/yyyy'), 
	'M', 
	2000.00,
	tp_nt_fone('7928-4543'),
	tp_endereco(137713, 'Rua 04'),
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 3333),
	8
);
INSERT INTO tb_tecnico VALUES (
	5555, 
	'Lidia Gomes', 
	to_date ('13/07/1989', 'dd/mm/yyyy'), 
	'F', 
	2500.00, 
	tp_nt_fone('9840-4362'),
	tp_endereco(555313, 'Rua 05'),
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 3333),
	6
);
INSERT INTO tb_graduado VALUES (
	6666, 
	'Joaquim Carvalho', 
	to_date ('28/04/1983', 'dd/mm/yyyy'), 
	'M', 
	4500.00, 
	tp_nt_fone('2235-1124'),
	tp_endereco(138893, 'Rua 06'),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111)
);
INSERT INTO tb_tecnico VALUES (
	7777, 
	'Paloma Morais', 
	to_date ('05/12/1990', 'dd/mm/yyyy'), 
	'F', 
	3500.00, 
	tp_nt_fone('9938-0003', '7930-6476', '3778-1122'),
	tp_endereco(133776, 'Rua 07'),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666),
	9
);

--inserindo Participações (15 no total)
INSERT INTO tb_participa VALUES (
	1, 
	1, 
	1111,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 1),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 1),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111)
);
INSERT INTO tb_participa VALUES (
	1, 
	1, 
	2222,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 1),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 1),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 2222)
);
INSERT INTO tb_participa VALUES (
	1, 
	2, 
	4444,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 1),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 1),
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 4444)
);
INSERT INTO tb_participa VALUES (
	2, 
	1, 
	1111,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 2),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 1),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111)
);
INSERT INTO tb_participa VALUES (
	2, 
	3, 
	7777,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 2),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 3),
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 7777)
);
INSERT INTO tb_participa VALUES (
	2, 
	5, 
	6666,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 2),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 5),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666)
);
INSERT INTO tb_participa VALUES (
	2, 
	4, 
	5555,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 2),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 4),
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 5555)
);
INSERT INTO tb_participa VALUES (
	2, 
	4, 
	6666,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 2),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 4),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666)
);
INSERT INTO tb_participa VALUES (
	2, 
	2, 
	4444,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 2),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 2),
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 4444)
);
INSERT INTO tb_participa VALUES (
	2,
	3, 
	3333,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 2),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 3),
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 3333)
);
INSERT INTO tb_participa VALUES (
	3, 
	5, 
	6666,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 3),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 5),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666)
);
INSERT INTO tb_participa VALUES (
	3, 
	4, 
	2222,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 3),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 4),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 2222)
);
INSERT INTO tb_participa VALUES (
	3, 
	2, 
	6666,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 3),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 2),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666)
);
INSERT INTO tb_participa VALUES (
	3,
	3, 
	1111,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 3),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 3),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111)
);
INSERT INTO tb_participa VALUES (
	3, 
	1, 
	2222,
	(SELECT REF(P) FROM tb_projeto P WHERE P.codigo = 3),
	(SELECT REF(A) FROM tb_atividade A WHERE A.codigo = 1),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 2222)
);

--inserindo Departamentos (3 no total)
INSERT INTO tb_departamento VALUES (
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111), 
	1, 
	'Vendas'
);
INSERT INTO tb_departamento VALUES (
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 3333), 
	2, 
	'Producao'
);
INSERT INTO tb_departamento VALUES (
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666),
	3, 
	'RH'
);

--inserindo Gratificações (3 no total)
INSERT INTO tb_gratificacao VALUES (1, 'Bonus de 50%');
INSERT INTO tb_gratificacao VALUES (2, 'Bonus de 30%');
INSERT INTO tb_gratificacao VALUES (3, 'Folga remunerada');

--inserindo Trabalhos (10 no total)
INSERT INTO tb_trabalha VALUES (
	1111, 
	1, 
	to_date ('01/02/1999', 'dd/mm/yyyy'), 
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 1),
	(SELECT REF(G) FROM tb_gratificacao G WHERE G.codigo = 3)
);
INSERT INTO tb_trabalha VALUES (
	2222, 
	1, 
	to_date ('04/07/2001', 'dd/mm/yyyy'), 
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 2222),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 1),
	(SELECT REF(G) FROM tb_gratificacao G WHERE G.codigo = 1)
);
INSERT INTO tb_trabalha VALUES (
	2222, 
	2, 
	to_date ('01/09/2005', 'dd/mm/yyyy'), 
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 2222),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 2),
	(SELECT REF(G) FROM tb_gratificacao G WHERE G.codigo = 3)
);
INSERT INTO tb_trabalha VALUES (
	3333, 
	2, 
	to_date ('26/12/2009', 'dd/mm/yyyy'), 
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 3333),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 2),
	NULL
);
INSERT INTO tb_trabalha VALUES (
	4444, 
	1, 
	to_date ('13/05/2010', 'dd/mm/yyyy'), 
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 4444),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 1),
	(SELECT REF(G) FROM tb_gratificacao G WHERE G.codigo = 2)
);
INSERT INTO tb_trabalha VALUES (
	5555, 
	3, 
	to_date ('28/05/2011', 'dd/mm/yyyy'), 
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 5555),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 3),
	NULL
);
INSERT INTO tb_trabalha VALUES (
	6666, 
	1, 
	to_date ('09/02/2005', 'dd/mm/yyyy'), 
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 1),
	NULL
);
INSERT INTO tb_trabalha VALUES (
	6666, 
	2, 
	to_date ('01/02/2009', 'dd/mm/yyyy'), 
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 2),
	(SELECT REF(G) FROM tb_gratificacao G WHERE G.codigo = 3)
);
INSERT INTO tb_trabalha VALUES (
	6666, 
	3, 
	to_date ('18/11/2013', 'dd/mm/yyyy'), 
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 3),
	(SELECT REF(G) FROM tb_gratificacao G WHERE G.codigo = 1)
);
INSERT INTO tb_trabalha VALUES (
	7777, 
	3, 
	to_date ('08/06/2014', 'dd/mm/yyyy'), 
	(SELECT REF(T) FROM tb_tecnico T WHERE T.cpf = 7777),
	(SELECT REF(D) FROM tb_departamento D WHERE D.codigo = 3),
	(SELECT REF(G) FROM tb_gratificacao G WHERE G.codigo = 2)
);

--inserindo Graus (2 ao todo)
INSERT INTO tb_grau VALUES (1, 'Administracao');
INSERT INTO tb_grau VALUES (2, 'Engenharia');

--inserindo IES (2 ao todo)
INSERT INTO tb_ies VALUES (1, 'Universidade Santana Braga', 'USB');
INSERT INTO tb_ies VALUES (2, 'Faculdade Indiana F. Antunes', 'FIFA');

--inserindo Titulações (4 ao todo)
INSERT INTO tb_titulacao_empregado VALUES (
	1111,
	to_date ('1979', 'yyyy'),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111),
	(SELECT REF(G) FROM tb_grau G WHERE G.codigo = 1),	
	(SELECT REF(I) FROM tb_ies I WHERE I.codigo = 1)
);
INSERT INTO tb_titulacao_empregado VALUES (
	2222,
	to_date ('1999', 'yyyy'),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 2222),
	(SELECT REF(G) FROM tb_grau G WHERE G.codigo = 1),	
	(SELECT REF(I) FROM tb_ies I WHERE I.codigo = 2)
);
INSERT INTO tb_titulacao_empregado VALUES (
	6666,
	to_date ('2005', 'yyyy'),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 6666),
	(SELECT REF(G) FROM tb_grau G WHERE G.codigo = 1),	
	(SELECT REF(I) FROM tb_ies I WHERE I.codigo = 2)
);
INSERT INTO tb_titulacao_empregado VALUES (
	1111,
	to_date ('2009', 'yyyy'),
	(SELECT REF(G) FROM tb_graduado G WHERE G.cpf = 1111),
	(SELECT REF(G) FROM tb_grau G WHERE G.codigo = 2),	
	(SELECT REF(I) FROM tb_ies I WHERE I.codigo = 1)
);
