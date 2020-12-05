DROP TABLE tb_titulacao_empregado;
DROP TABLE tb_participa;
DROP TABLE tb_trabalha;
DROP TABLE tb_departamento force;
DROP TABLE tb_atividade force;
DROP TABLE tb_gratificacao force;
DROP TABLE tb_grau force;
DROP TABLE tb_projeto force;
DROP TABLE tb_ies force;
DROP TABLE tb_tecnico;
DROP TABLE tb_graduado;

CREATE TABLE tb_projeto OF tp_projeto (
	PRIMARY KEY (codigo),
	descricao NOT NULL,
	valor NOT NULL
);

CREATE TABLE tb_atividade OF tp_atividade (
	PRIMARY KEY (codigo),
	descricao NOT NULL
);

CREATE TABLE tb_tecnico OF tp_tecnico (
	PRIMARY KEY (cpf),
	nome NOT NULL,
	dt_nasc NOT NULL,
	sexo NOT NULL,
	salario NOT NULL,
	ultima_serie NOT NULL
) NESTED TABLE telefone STORE AS tb_telefone_tec;

CREATE TABLE tb_graduado OF tp_graduado (
	PRIMARY KEY (cpf),
	nome NOT NULL,
	dt_nasc NOT NULL,
	sexo NOT NULL,
	salario NOT NULL
) NESTED TABLE telefone STORE AS tb_telefone_grad;

CREATE TABLE tb_participa OF tp_participa (
	PRIMARY KEY (cpf, codigo_projeto, codigo_atividade),
	FOREIGN KEY (ref_projeto) REFERENCES tb_projeto,
	FOREIGN KEY (ref_atividade) REFERENCES tb_atividade
);

CREATE TABLE tb_departamento OF tp_departamento (
	PRIMARY KEY (codigo),
	descricao NOT NULL
);

CREATE TABLE tb_gratificacao OF tp_gratificacao (
	PRIMARY KEY (codigo),
	descricao NOT NULL
);

CREATE TABLE tb_trabalha OF tp_trabalha (
	PRIMARY KEY (cpf, codigo_depto, data_trabalha),
	FOREIGN KEY (ref_depto) REFERENCES tb_departamento,
	FOREIGN KEY (ref_gratificacao) REFERENCES tb_gratificacao
);

CREATE TABLE tb_grau OF tp_grau (
	PRIMARY KEY (codigo),
	tipo NOT NULL
);

CREATE TABLE tb_ies OF tp_ies (
	PRIMARY KEY (codigo),
	nome NOT NULL,
	sigla NOT NULL
);

CREATE TABLE tb_titulacao_empregado OF tp_titulacao_empregado (
	PRIMARY KEY (cpf, data_titulacao),
	FOREIGN KEY (ref_graduado) REFERENCES tb_graduado,
	FOREIGN KEY (ref_grau) REFERENCES tb_grau,
	FOREIGN KEY (ref_ies) REFERENCES tb_ies
);