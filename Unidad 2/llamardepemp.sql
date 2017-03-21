DECLARE
	nombre_emp	 	Employees.first_name%TYPE;
	apellido_emp 	Employees.last_name%TYPE;
	salario_emp	 	Employees.salary%TYPE;
  	depa_emp      	Departments.department_name%TYPE;
BEGIN

	depart_employee(nombre_emp,apellido_emp,salario_emp,depa_emp);

END;