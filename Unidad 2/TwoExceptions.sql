DECLARE
	nombre		VARCHAR2(2);
	apellido	Employees.last_name%TYPE;
	salario		Employees.salary%TYPE;
	mensaje		VARCHAR2(50);
	format_invalid EXCEPTION;
	PRAGMA EXCEPTION_INIT
		(format_invalid, -06502);
	longitud_identificador EXCEPTION;
	PRAGMA EXCEPTION_INIT
		(longitud_identificador, -06501);

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
	WHEN longitud_identificador THEN
		DBMS_OUTPUT.PUT_LINE('La longitud del identificador excede el formato');
		DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;