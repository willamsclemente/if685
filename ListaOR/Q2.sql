SET SERVEROUTPUT ON
ALTER TYPE tp_empregado
      ADD MAP MEMBER FUNCTION empToInt RETURN NUMBER CASCADE;
	
ALTER TYPE tp_tecnico
      ADD OVERRIDING MAP MEMBER FUNCTION empToInt RETURN NUMBER CASCADE;
	  
CREATE OR REPLACE TYPE BODY tp_tecnico AS
OVERRIDING MAP MEMBER FUNCTION empToInt RETURN NUMBER IS
      BEGIN
	  RETURN ultima_serie * cpf;
	  END;
END;
/
ALTER TYPE tp_graduado
ADD OVERRIDING MAP MEMBER FUNCTION empToInt RETURN NUMBER CASCADE;

CREATE OR REPLACE TYPE BODY tp_graduado AS
OVERRIDING MAP MEMBER FUNCTION empToInt RETURN NUMBER IS
    BEGIN
	RETURN cpf;
	END;
END;
/

SELECT T.ref_empregado.nome, T.ref_empregado.cpf
FROM tb_trabalha T
ORDER BY DEREF(T.ref_empregado);
