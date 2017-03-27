DECLARE
  nombre_empleado 	VARCHAR2(50);
  salario_empleado 	Employees.salary%TYPE;
  isrEmp 			NUMBER(20,4);
  totalEmp 			NUMBER(20,4);
BEGIN
 calcular_ISR_procedure(nombre_empleado, salario_empleado, isrEmp,totalEmp);
END;