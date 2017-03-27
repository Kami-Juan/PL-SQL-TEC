DECLARE
	nombre		Employees.first_name%TYPE;
	apellido	Employees.last_name%TYPE;
	salario		Employees.salary%TYPE;
	mensaje		VARCHAR2(50);
	format_invalid EXCEPTION;
	PRAGMA EXCEPTION_INIT
		(format_invalid, -06502);

BEGIN
	SELECT first_name, last_name, TO_CHAR(salary, '$999,999.99')
	INTO   nombre, apellido, salario
	FROM Employees
	WHERE employee_id = 101;
		DBMS_OUTPUT.PUT_LINE(nombre||' '||apellido||' , su salario es '||salario);
	EXCEPTION
	WHEN format_invalid THEN
		DBMS_OUTPUT.PUT_LINE('El valor del formato no corresponde');
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
