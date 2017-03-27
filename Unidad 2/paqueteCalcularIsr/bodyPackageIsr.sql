CREATE OR REPLACE PACKAGE BODY packISR IS
FUNCTION cal_Isr
(salario  IN  NUMBER )
RETURN NUMBER IS
ISR_final NUMBER := 0;
BEGIN
    ISR_final :=
        CASE
            WHEN salario >= 0 AND salario <= 5000 THEN .0
            WHEN salario > 5000 AND salario <= 10000 THEN .10
            WHEN salario > 10000 AND salario <= 20000 THEN .20
            WHEN salario > 20000 AND salario <= 30000 THEN .30
            ELSE .35
        END;
    RETURN ISR_final;
END cal_Isr;
PROCEDURE calcular_ISR_procedure
(nombre_completo OUT VARCHAR2,
 salario_emp    OUT NUMBER,
 total_isr  OUT     NUMBER,
 total_salario  OUT     NUMBER )
IS
CURSOR calcular_ISR IS
      SELECT first_name||' '||last_name, salary
      FROM Employees;
     BEGIN
        OPEN calcular_ISR;
            LOOP
                FETCH calcular_ISR INTO nombre_completo, salario_emp;
                    total_isr:=salario_emp * cal_Isr(salario_emp);
     				total_salario:=salario_emp-(salario_emp * cal_Isr(salario_emp));
                    DBMS_OUTPUT.PUT_LINE('Su nombre es:'||nombre_completo||'.');
                    DBMS_OUTPUT.PUT_LINE('su salario es:'||salario_emp||'.');
                    DBMS_OUTPUT.PUT_LINE('Su descuento del ISR es:'||total_isr||'.');
                    DBMS_OUTPUT.PUT_LINE('Su salario total es:'||total_salario||'.');
                    DBMS_OUTPUT.PUT_LINE('');
                EXIT WHEN calcular_ISR%NOTFOUND;
            END LOOP;
        CLOSE calcular_ISR;
     END calcular_ISR_procedure;
END packISR;