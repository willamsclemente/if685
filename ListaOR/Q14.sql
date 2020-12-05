SET SERVEROUTPUT ON;
DECLARE
media_idade NUMBER;
sal NUMBER;
age NUMBER;
BEGIN
SELECT AVG(g.getIdade()) INTO media_idade
FROM tb_graduado g;

SELECT (t.getIdade()), salario INTO age, sal
FROM tb_graduado t
WHERE t.cpf = 6666;

IF age > media_idade THEN
UPDATE tb_graduado g 
SET g.salario = sal + 500 
WHERE g.cpf = 6666;

SELECT g.salario INTO sal
FROM tb_graduado g
WHERE g.cpf = 6666;

DBMS_OUTPUT.PUT_LINE('Empregado de CPF 6666 tem idade acima da media. Seu novo salario e '||
             TO_CHAR(sal));
ELSE
    DBMS_OUTPUT.PUT_LINE('Empregado de CPF 6666 tem idade menor que a media. Seu salario ' ||
	        TO_CHAR(sal));
END IF;
END;
/

