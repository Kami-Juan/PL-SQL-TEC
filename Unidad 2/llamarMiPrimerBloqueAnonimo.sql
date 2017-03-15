DECLARE
	ide				Employees.Employee_id%TYPE;
	nombre_emp	 	Employees.first_name%TYPE;
	apellido_emp 	Employees.last_name%TYPE;
	salario_emp	 	Employees.salary%TYPE;
	contrata_emp  	Employees.hire_date%TYPE;
BEGIN
        ide:=101;
		consulta_emp(ide,nombre_emp,apellido_emp,salario_emp,contrata_emp);
END;