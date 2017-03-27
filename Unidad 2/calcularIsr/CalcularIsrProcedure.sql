CREATE OR REPLACE PROCEDURE calcular_ISR_procedure
(nombre_completo OUT VARCHAR2,
 salario_emp    OUT NUMBER,
 total_isr  OUT     NUMBER,
 total_salario  OUT     NUMBER )
IS
CURSOR calcular_ISR IS
      SELECT e.first_name||' '||e.last_name, e.salary, e.salary * cal_Isr(e.salary), e.salary -(e.salary * cal_Isr(e.salary))
      FROM Employees e;
     BEGIN
        OPEN calcular_ISR;
            LOOP
                FETCH calcular_ISR INTO nombre_completo, salario_emp, total_isr, total_salario;
                    DBMS_OUTPUT.PUT_LINE('Su nombre es:'||nombre_completo||'.');
                    DBMS_OUTPUT.PUT_LINE('su salario es:'||salario_emp||'.');
                    DBMS_OUTPUT.PUT_LINE('Su descuento del ISR es:'||total_isr||'.');
                    DBMS_OUTPUT.PUT_LINE('Su salario total es:'||total_salario||'.');
                    DBMS_OUTPUT.PUT_LINE('');
                EXIT WHEN calcular_ISR%NOTFOUND;
            END LOOP;
        CLOSE calcular_ISR;
     END calcular_ISR_procedure;