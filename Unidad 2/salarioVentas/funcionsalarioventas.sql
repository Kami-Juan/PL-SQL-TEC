CREATE OR REPLACE FUNCTION salario_ventas
(ide IN  NUMBER)
RETURN NUMBER IS
salarioTotal NUMBER := 0;
BEGIN
  SELECT NVL((e.salary+(e.commission_pct*e.salary)),e.salary)
    INTO salarioTotal
    FROM employees e
    WHERE e.employee_id = ide;
      RETURN salarioTotal;
END salario_ventas;