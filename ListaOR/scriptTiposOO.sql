--DROP TYPE tp_va_fone force;
DROP TYPE tp_nt_fone force;
DROP TYPE tp_titulacao_empregado force;
DROP TYPE tp_tecnico force;
DROP TYPE tp_graduado force;
DROP TYPE tp_participa force;
DROP TYPE tp_trabalha force;
DROP TYPE tp_departamento force;
DROP TYPE tp_empregado force;
DROP TYPE tp_atividade force;
DROP TYPE tp_gratificacao force;
DROP TYPE tp_grau force;
DROP TYPE tp_projeto force;
DROP TYPE tp_ies force;

--telefones como VARRAY: supondo um máximo de 4 telefones por empregado
/*CREATE OR REPLACE TYPE tp_va_fone as varray (4) of varchar2 (9);
/
*/
--telefones como TABLE (nested table): não é preciso estabelecer um limite de telefones
CREATE OR REPLACE TYPE tp_nt_fone AS TABLE OF VARCHAR2 (9);
/

CREATE OR REPLACE TYPE tp_projeto AS OBJECT (
	codigo NUMBER,
	descricao VARCHAR2(30),
	valor DECIMAL(8,2)
) FINAL;
/
i
CREATE OR REPLACE TYPE tp_atividade AS OBJECT(
	codigo NUMBER,
	descricao VARCHAR2(30)
) FINAL;
/

CREATE OR REPLACE TYPE tp_endereco AS OBJECT (
	cep NUMBER,
	descricao VARCHAR2(30)
) FINAL;
/

CREATE OR REPLACE TYPE tp_empregado AS OBJECT(
	cpf NUMBER,
	nome VARCHAR2(50),
	dt_nasc DATE,
	sexo CHAR(1),
	salario DECIMAL(6,2),
	--telefone tp_va_fone,		--fone como VARRAY
	telefone tp_nt_fone,		--fone como NESTED TABLE
	endereco tp_endereco,
	ref_chefe REF tp_empregado
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_participa AS OBJECT(
	codigo_projeto NUMBER,
	codigo_atividade NUMBER,
	cpf NUMBER,
	ref_projeto REF tp_projeto,
	ref_atividade REF tp_atividade,
	ref_empregado REF tp_empregado
) FINAL;
/

CREATE OR REPLACE TYPE tp_departamento AS OBJECT(
	ref_chefe REF tp_empregado, 
	codigo NUMBER,
	descricao VARCHAR2(30)
) FINAL;
/

CREATE OR REPLACE TYPE tp_gratificacao AS OBJECT(
	codigo NUMBER,
	descricao VARCHAR2(30)
) FINAL;
/
 
CREATE OR REPLACE TYPE tp_trabalha AS OBJECT(
	cpf NUMBER,
	codigo_depto NUMBER, 
	data_trabalha DATE,
	ref_empregado REF tp_empregado, 
	ref_depto REF tp_departamento,
	ref_gratificacao REF tp_gratificacao
) FINAL;
/

CREATE OR REPLACE TYPE tp_tecnico under tp_empregado(
	ultima_serie NUMBER
) FINAL;
/

CREATE OR REPLACE TYPE tp_graduado under tp_empregado() FINAL;
/

CREATE OR REPLACE TYPE tp_grau AS OBJECT(
	codigo NUMBER,
	tipo VARCHAR2(30)
) FINAL;
/

CREATE OR REPLACE TYPE tp_ies AS OBJECT(
	codigo NUMBER,
	nome VARCHAR2(30),
	sigla VARCHAR2(5)
) FINAL;
/

CREATE OR REPLACE TYPE tp_titulacao_empregado AS OBJECT(
	cpf NUMBER,
	data_titulacao DATE,
	ref_graduado REF tp_graduado, 
	ref_grau REF tp_grau,
	ref_ies REF tp_ies
) FINAL;
/
