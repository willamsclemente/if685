ALTER TYPE tp_trabalha
ADD MEMBER FUNCTION tempoTrabalho RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY tp_trabalha AS
MEMBER FUNCTION tempoTrabalho RETURN NUMBER IS
BEGIN
   RETURN ((SYSDATE - data_trabalha)/365);
END;
END;
/

SELECT t.ref_empregado.nome as Nome, t.ref_depto.descricao as Departamento
FROM tb_trabalha t
WHERE t.tempoTrabalho() > 10;