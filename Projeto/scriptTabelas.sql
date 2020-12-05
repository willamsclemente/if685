DROP TABLE TB_POSICIONADORES;
DROP TABLE TB_ATUADORES;
DROP TABLE TB_VALVULAS;
DROP TABLE TB_SENSORES;
DROP TABLE TB_FLUXOINST;
DROP TABLE TB_FLUX_PROJ;
DROP TABLE TB_FLUXOGRAMA;
DROP TABLE TB_EXECUCAO;
DROP TABLE TB_PROJETOS;
DROP TABLE TB_PLANTA_INDUSTRIAL;
DROP TABLE TB_PROJETISTA;
DROP TABLE TB_INSTRUMENTISTA;
DROP TABLE TB_SALARIO;


CREATE TABLE TB_INSTRUMENTISTA OF TP_INSTRUMENTISTA(
PRIMARY KEY (CPF),
NOME NOT NULL,
SOBRENOME NOT NULL,
IDADE NOT NULL,
DATA_ENTRADA NOT NULL,
TURNO NOT NULL
) NESTED TABLE TELEFONE STORE AS TB_TELEFONE_INS;

CREATE TABLE TB_PROJETISTA OF TP_PROJETISTA(
PRIMARY KEY (CPF),
NOME NOT NULL,
SOBRENOME NOT NULL,
IDADE NOT NULL,
DATA_ENTRADA NOT NULL,
ESPECIALIZACAO NOT NULL,
FORMACAO_SUP NOT NULL,
CREA NOT NULL
) NESTED TABLE TELEFONE STORE AS TB_TELEFONE_PROJ;

CREATE TABLE TB_SALARIO OF TP_SALARIO(
PRIMARY KEY (CPF),
DATA_REAJUSTE NOT NULL
VALOR_SAL NOT NULL,
MOEDA NOT NULL
);

CREATE TABLE TB_PLANTA_INDUSTRIAL OF TP_PLANTA_INDUSTRIAL(
PRIMARY KEY (TAG_PLANTA),
INDUSTRIA UNIQUE NOT NULL,
LOCALIZACAO UNIQUE NOT NULL
);

CREATE TABLE TB_PROJETOS OF TP_PROJETOS(
PRIMARY KEY (COD_PROJ),
CLIENTE NOT NULL,
DESCRICAO NOT NULL
);

CREATE TABLE TB_EXECUCAO OF TP_EXECUCAO(
PRIMARY KEY(CPF, COD_PROJ),
TAG_PLANTA UNIQUE NOT NULL,
DATA_EXEC NOT NULL,
FOREIGN KEY (REF_PROJETISTA) REFERENCES TB_PROJETISTA,
FOREIGN KEY (REF_PROJETOS) REFERENCES TB_PROJETOS,
FOREIGN KEY (REF_PLANTA_INDUSTRIAL) REFERENCES TB_PLANTA_INDUSTRIAL
);

CREATE TABLE TB_FLUXOGRAMA OF TP_FLUXOGRAMA(
PRIMARY KEY (COD_FLUX),
NUM_DOC NOT NULL,
AREA NOT NULL,
FOREIGN KEY (REF_PROJETISTA) REFERENCES TB_PROJETISTA
);

CREATE TABLE TB_FLUX_PROJ OF TP_FLUX_PROJ( 
PRIMARY KEY(COD_FLUX, COD_PROJ),
FOREIGN KEY(REF_FLUXOGRAMA) REFERENCES TB_FLUXOGRAMA,
FOREIGN KEY(REF_PROJETOS) REFERENCES TB_PROJETOS
);

CREATE TABLE TB_FLUXOINST OF TP_FLUXOINST(
PRIMARY KEY(COD_FLUX, TAG_INST),
FOREIGN KEY(REF_FLUXOGRAMA) REFERENCES TB_FLUXOGRAMA
);

CREATE TABLE TB_SENSORES OF TP_SENSORES(
PRIMARY KEY(TAG_INST),
DATA_FAB NOT NULL,
UNID_ENG NOT NULL,
MIN_VAL NOT NULL,
MAX_VAL NOT NULL,
FUNCAO NOT NULL,
SINAL NOT NULL,
SENSIBILIDADE NOT NULL
);

CREATE TABLE TB_VALVULAS OF TP_VALVULAS(
PRIMARY KEY(TAG_INST),
DATA_FAB NOT NULL,
UNID_ENG NOT NULL,
MIN_VAL NOT NULL,
MAX_VAL NOT NULL,
ESTRUTURA NOT NULL,
DIAMETRO NOT NULL,
VEDACAO NOT NULL
);

CREATE TABLE TB_ATUADORES OF TP_ATUADORES(
PRIMARY KEY(TAG_INST),
DATA_FAB NOT NULL,
UNID_ENG NOT NULL,
MIN_VAL NOT NULL,
MAX_VAL NOT NULL,
DIAMETRO NOT NULL,
EIXO NOT NULL,
TAG_V UNIQUE NOT NULL,
FOREIGN KEY(REF_VALVULAS) REFERENCES TB_VALVULAS
);

CREATE TABLE TB_POSICIONADORES OF TP_POSICIONADORES(
PRIMARY KEY(TAG_INST),
DATA_FAB NOT NULL,
UNID_ENG NOT NULL,
MIN_VAL NOT NULL,
MAX_VAL NOT NULL,
ACIONAMENTO NOT NULL,
TEMPO_RESP NOT NULL,
FUNC_DIAG NOT NULL,
TAG_A UNIQUE NOT NULL,
FOREIGN KEY(REF_ATUADORES) REFERENCES TB_ATUADORES
);