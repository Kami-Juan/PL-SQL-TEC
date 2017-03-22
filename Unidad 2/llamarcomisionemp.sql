DECLARE
	nombre_emp	 		Employees.first_name%TYPE;
	apellido_emp 	    Employees.last_name%TYPE;
	salario_emp	 		VARCHAR2(15);
  	comision_emp     	VARCHAR2(15);
	salarioTotal_emp	VARCHAR2(15);

BEGIN

	commission_emp(nombre_emp,apellido_emp,salario_emp,comision_emp,salarioTotal_emp);

END;