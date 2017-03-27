CREATE OR REPLACE FUNCTION cal_Isr
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




