SET SERVEROUTPUT ON;
DECLARE
BEGIN 
  FOR reg_grat IN (SELECT t.ref_gratificacao.descricao AS gratificacao, COUNT(*) AS num 
                   FROM tb_trabalha t
				   WHERE t.ref_gratificacao IS NOT DANGLING
                   GROUP BY t.ref_gratificacao.descricao)
  LOOP
    DBMS_OUTPUT.PUT_LINE('Gratificacao: '||reg_grat.gratificacao || ' Numero de vezes: '|| reg_grat.num);
	
  END LOOP;
END;
/  