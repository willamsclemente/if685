DROP TABLE trabalha;
DROP TABLE departamento;
DROP TABLE participa;
DROP TABLE atividade;
DROP TABLE projeto;
DROP TABLE empregado;


CREATE TABLE empregado (
	cpf NUMBER,
	cpf_lider NUMBER,
	nome VARCHAR2(50) NOT NULL,
	dt_nasc DATE NOT NULL,
	sexo CHAR(1) NOT NULL,
	salario DECIMAL(6,2) NOT NULL,
	CONSTRAINT empregado_pk PRIMARY KEY (cpf),
	CONSTRAINT empregado_fk FOREIGN KEY (cpf_lider) REFERENCES empregado (cpf),
	CONSTRAINT empregado_check CHECK (sexo = 'M' OR sexo = 'F')
);



CREATE TABLE projeto (
	codigo NUMBER,
	descricao VARCHAR2(30) NOT NULL,
	valor DECIMAL(8,2) NOT NULL,
	CONSTRAINT codigo_projeto_pk PRIMARY KEY (codigo)
);

CREATE TABLE atividade (
	codigo NUMBER,
	descricao VARCHAR2(30) NOT NULL,
	CONSTRAINT codigo_atividade_pk PRIMARY KEY (codigo)
);
CREATE TABLE participa (
	codigo_projeto NUMBER,
	codigo_atividade NUMBER,
	cpf NUMBER,
	CONSTRAINT participa_pk PRIMARY KEY (codigo_projeto,codigo_atividade,cpf),
	CONSTRAINT participa_codigo_projeto_fk FOREIGN KEY (codigo_projeto) REFERENCES projeto (codigo),
	CONSTRAINT participa_codigo_atividade_fk FOREIGN KEY (codigo_atividade) REFERENCES atividade (codigo),
	CONSTRAINT participa_CPF_fk FOREIGN KEY (cpf) REFERENCES Empregado (cpf)
);
CREATE TABLE departamento (
	cpf_chefe NUMBER UNIQUE NOT NULL, 
	codigo NUMBER,
	descricao VARCHAR2(30) NOT NULL,
	CONSTRAINT departamento_pk PRIMARY KEY (codigo),
	CONSTRAINT departamento_fk FOREIGN KEY (cpf_chefe) REFERENCES empregado (cpf)
);

CREATE TABLE trabalha (
	cpf NUMBER, 
	codigo_depto NUMBER NOT NULL,
	data_trabalha DATE NOT NULL,
	CONSTRAINT trabalha_pk PRIMARY KEY (cpf, codigo_depto,data_trabalha),
	CONSTRAINT trabalha_empregado_fk FOREIGN KEY (CPF) REFERENCES Empregado (CPF),
	CONSTRAINT trabalha_departamento_fk FOREIGN KEY (codigo_depto) REFERENCES departamento (codigo)
);