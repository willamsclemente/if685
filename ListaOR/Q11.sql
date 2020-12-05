SET SERVEROUTPUT ON;
ALTER TYPE tp_projeto 
ADD MAP MEMBER FUNCTION novoValor RETURN NUMBER CASCADE;
CREATE OR REPLACE TYPE BODY tp_projeto AS
MAP MEMBER FUNCTION novoValor RETURN NUMBER IS
BEGIN 
DBMS.DBMS_OUTPUT.PUT_LINE('O vslor do projeto foi duplicado');
RETURN (SELF.valor*2);
END;
END;
/
DECLARE
proj tp_projeto;
BEGIN
   SELECT  DEREF(ref_projeto) INTO proj
   FROM tb_participa p
   WHERE ref_projeto.codigo = 1;
   DBMS.DBMS_OUTPUT.PUT_LINE(proj.novoValor());
 END;
 /
				   