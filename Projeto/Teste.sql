DROP TABLE POSICIONADORES;
DROP TABLE ATUADORES;
DROP TABLE VALVULAS;
DROP TABLE SENSORES;
DROP TABLE FLUXOINST;
DROP TABLE INSTRUMENTOS;
DROP TABLE FLUX_PROJ;
DROP TABLE FLUXOGRAMA;
DROP TABLE EXECUCAO;
DROP TABLE PROJETOS;
DROP TABLE PLANTA_INDUSTRIAL;
DROP TABLE PROJETISTA;
DROP TABLE EPI_INST;
DROP TABLE CAPACITACAO_INST;
DROP TABLE INSTRUMENTISTA;
DROP TABLE SALARIO;
DROP TABLE TELEFONE_FUNC;
DROP TABLE FUNCIONARIO;
CREATE TABLE FUNCIONARIO(
CPF VARCHAR(11),
NOME VARCHAR(20) NOT NULL,
SOBRENOME VARCHAR(20) NOT NULL,
IDADE NUMBER NOT NULL,
DATA_ENTRADA DATE,
CPF_CHEFE VARCHAR(11),
CONSTRAINT PK_FUNCIONARIO PRIMARY KEY(CPF),
CONSTRAINT FK_FUNCIONARIO FOREIGN KEY(CPF_CHEFE) REFERENCES
FUNCIONARIO(CPF)
);
CREATE TABLE TELEFONE_FUNC(
CPF VARCHAR(11),
TELEFONE VARCHAR(14),
CONSTRAINT PK_TEL_FUNC PRIMARY KEY(CPF,TELEFONE),
CONSTRAINT FK_TEL_FUNC FOREIGN KEY (CPF) REFERENCES FUNCIONARIO(CPF)
);
CREATE TABLE SALARIO(
CPF VARCHAR(11),
DATA_REAJUSTE DATE,
VALOR_SAL NUMBER NOT NULL,
MOEDA VARCHAR(10) NOT NULL,
CONSTRAINT PK_SALARIO PRIMARY KEY(CPF),
CONSTRAINT FK_SAL_FUNC FOREIGN KEY(CPF) REFERENCES FUNCIONARIO(CPF)
);
CREATE TABLE INSTRUMENTISTA(
CPF VARCHAR(11),
TURNO VARCHAR(9) NOT NULL,
CONSTRAINT PK_INSTRUMENTISTA PRIMARY KEY(CPF),
CONSTRAINT FK_INST_FUNC FOREIGN KEY(CPF) REFERENCES FUNCIONARIO(CPF)
);
CREATE TABLE CAPACITACAO_INST(
CPF VARCHAR(11),
CAPACITACAO VARCHAR(20),
CONSTRAINT PK_CAP_INST PRIMARY KEY(CPF,CAPACITACAO),
CONSTRAINT FK_CAP_INST FOREIGN KEY(CPF) REFERENCES INSTRUMENTISTA(CPF)
);
CREATE TABLE EPI_INST(
CPF VARCHAR(11),
EPI VARCHAR(20),
CONSTRAINT PK_EPI_INST PRIMARY KEY(CPF,EPI),
CONSTRAINT FK_EPI_INST FOREIGN KEY(CPF) REFERENCES INSTRUMENTISTA(CPF)
);
CREATE TABLE PROJETISTA(
CPF VARCHAR(11),
ESPECIALIZACAO VARCHAR(20),
FORMACAO_SUP VARCHAR(20),
CREA VARCHAR(15),
CONSTRAINT PK_PROJETISTA PRIMARY KEY(CPF),
CONSTRAINT FK_PROJ_FUNC FOREIGN KEY(CPF) REFERENCES FUNCIONARIO(CPF)
);
CREATE TABLE PLANTA_INDUSTRIAL(
TAG_PLANTA VARCHAR(10),
INDUSTRIA VARCHAR(20) UNIQUE NOT NULL,
LOCALIZACAO VARCHAR(20) UNIQUE,
CONSTRAINT PK_PLANTA PRIMARY KEY(TAG_PLANTA)
);
CREATE TABLE PROJETOS(
COD_PROJ VARCHAR(15),
CLIENTE VARCHAR(15) NOT NULL,
DESCRICAO VARCHAR(30) NOT NULL,
CONSTRAINT PK_PROJETO PRIMARY KEY(COD_PROJ)
);
CREATE TABLE EXECUCAO(
CPF VARCHAR(11),
COD_PROJ VARCHAR(15),
TAG_PLANTA VARCHAR(10) UNIQUE NOT NULL,
DATA_EXEC DATE,
CONSTRAINT PK_EXECUCAO PRIMARY KEY(CPF, COD_PROJ),
CONSTRAINT FK_EXEC_PROJETISTA FOREIGN KEY(CPF) REFERENCES PROJETISTA(CPF),
CONSTRAINT FK_EXEC_PROJETO FOREIGN KEY(COD_PROJ) REFERENCES
PROJETOS(COD_PROJ),
CONSTRAINT FK_EXEC_PLNT FOREIGN KEY(TAG_PLANTA) REFERENCES
PLANTA_INDUSTRIAL(TAG_PLANTA)
);
CREATE TABLE FLUXOGRAMA(
COD_FLUX VARCHAR(15),
NUM_DOC VARCHAR(15),
AREA VARCHAR(15),
CPF VARCHAR(11) NOT NULL,
CONSTRAINT PK_FLUXOGRAMA PRIMARY KEY(COD_FLUX),
CONSTRAINT FK_FLUX_PROJETISTA FOREIGN KEY(CPF) REFERENCES PROJETISTA(CPF)
);
CREATE TABLE FLUX_PROJ(
COD_FLUX VARCHAR(15),
COD_PROJ VARCHAR(15),
CONSTRAINT PK_FLUXPROJ PRIMARY KEY(COD_FLUX, COD_PROJ),
CONSTRAINT FK_FLUXPROJ_FLUX FOREIGN KEY(COD_FLUX) REFERENCES
FLUXOGRAMA(COD_FLUX),
CONSTRAINT FK_FLUXPROJ_PROJ FOREIGN KEY(COD_PROJ) REFERENCES
PROJETOS(COD_PROJ)
);
CREATE TABLE INSTRUMENTOS(
TAG_INST VARCHAR(10),
DATA_FAB DATE,
UNID_ENG VARCHAR(5) NOT NULL,
MIN_VAL NUMBER NOT NULL,
MAX_VAL NUMBER NOT NULL,
CONSTRAINT PK_INSTRUMENTOS PRIMARY KEY(TAG_INST)
);
CREATE TABLE FLUXOINST(
COD_FLUX VARCHAR(15),
TAG_INST VARCHAR(10),
CONSTRAINT PK_FLUXINST PRIMARY KEY(COD_FLUX, TAG_INST),
CONSTRAINT FK_FLUXINST_FLUX FOREIGN KEY(COD_FLUX) REFERENCES
FLUXOGRAMA(COD_FLUX),
CONSTRAINT FK_FLUXINST_TAG FOREIGN KEY(TAG_INST) REFERENCES
INSTRUMENTOS(TAG_INST)
);
CREATE TABLE SENSORES(
TAG_INST VARCHAR(10),
FUNCAO VARCHAR(15),
SINAL VARCHAR(15),
SENSIBILIDADE NUMBER,
CONSTRAINT PK_SENSORES PRIMARY KEY(TAG_INST),
CONSTRAINT FK_SENS_INST FOREIGN KEY(TAG_INST) REFERENCES
INSTRUMENTOS(TAG_INST)
);
CREATE TABLE VALVULAS(
TAG_INST VARCHAR(10),
ESTRUTURA VARCHAR(15),
DIAMETRO NUMBER,
VEDACAO VARCHAR(15),
CONSTRAINT PK_VALVULAS PRIMARY KEY(TAG_INST),
CONSTRAINT FK_VLVS_INST FOREIGN KEY(TAG_INST) REFERENCES
INSTRUMENTOS(TAG_INST)
);
CREATE TABLE ATUADORES(
TAG_INST VARCHAR(10),
TIPO VARCHAR(15),
DIAMETRO NUMBER,
EIXO VARCHAR(10),
TAG_V VARCHAR(10) UNIQUE NOT NULL,
CONSTRAINT PK_ATUADORES PRIMARY KEY(TAG_INST),
CONSTRAINT FK_ACT_INST FOREIGN KEY(TAG_INST) REFERENCES
INSTRUMENTOS(TAG_INST),
CONSTRAINT FK_ACT_VLVS FOREIGN KEY(TAG_V) REFERENCES VALVULAS(TAG_INST)
);
CREATE TABLE POSICIONADORES(
TAG_INST VARCHAR(10),
ACIONAMENTO VARCHAR(15),
TEMPO_RESP NUMBER,
FUNC_DIAG VARCHAR(4),
TAG_A VARCHAR(10) UNIQUE NOT NULL,
CONSTRAINT PK_POSICIONADORES PRIMARY KEY(TAG_INST),
CONSTRAINT FK_POS_INST FOREIGN KEY(TAG_INST) REFERENCES
INSTRUMENTOS(TAG_INST),
CONSTRAINT FK_POS_ACT FOREIGN KEY(TAG_A) REFERENCES ATUADORES(TAG_INST)
);