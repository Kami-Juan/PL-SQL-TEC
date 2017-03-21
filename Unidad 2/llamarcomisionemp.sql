DECLARE
	nombre_emp	 		Employees.first_name%TYPE;
	apellido_emp 	    Employees.last_name%TYPE;
	salario_emp	 		Employees.salary%TYPE;
  	comision_emp     	Employees.commission_pct%TYPE;
	salarioTotal_emp	Employees.salary%TYPE;

BEGIN

	commission_emp(nombre_emp,apellido_emp,salario_emp,comision_emp,salarioTotal_emp);

END;