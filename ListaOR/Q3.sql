SET SERVEROUTPUT ON
ALTER TYPE tp_atividade
    ADD CONSTRUCTOR FUNCTION tp_atividade(codigo NUMBER) RETURN SELF AS RESULT CASCADE;
	
CREATE OR REPLACE TYPE BODY tp_atividade AS
CONSTRUCTOR FUNCTION tp_atividade(codigo NUMBER) RETURN SELF AS RESULT IS
BEGIN
SELF.codigo := codigo;
SELF.descricao := 'Nao especificado pelo usuario';
RETURN;
END;
END;
/

DECLARE
atividade tp_atividade;
BEGIN
atividade := NEW tp_atividade(10);
INSERT INTO tb_atividade VALUES(atividade.codigo, atividade.descricao);
END;
/

