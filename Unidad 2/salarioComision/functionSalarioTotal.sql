CREATE OR REPLACE FUNCTION funcSalary
(ISR  IN  NUMBER )
RETURN NUMBER IS
salarioTotal NUMBER := 0;
BEGIN
    salarioTotal:= salario +(comision*salario);
	RETURN salarioTotal;
END;



