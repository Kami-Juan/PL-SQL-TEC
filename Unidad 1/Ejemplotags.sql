<<EXTERNO>>
DECLARE
	id Employees.employee_id%TYPE:=103;
	nombre  Employees.first_name%TYPE;
	apellido  Employees.last_name%TYPE;
	salario  Employees.salary%TYPE;
BEGIN
	<<INTERNO>>
	DECLARE

		id Employees.employee_id%TYPE:=203;
		nombre  Employees.first_name%TYPE;
		apellido  Employees.last_name%TYPE;
		salario  Employees.salary%TYPE;

		BEGIN
			<<INTERN>>
				DECLARE

					id Employees.employee_id%TYPE:=130;
					nombre  Employees.first_name%TYPE;
					apellido  Employees.last_name%TYPE;
					salario  Employees.salary%TYPE;

					BEGIN
						SELECT employee_id, first_name, last_name, salary
						INTO id,nombre,apellido,salario
						FROM Employees
						WHERE employee_id = INTERNO.id;
						DBMS_OUTPUT.PUT_LINE('El id del empleado es: '||id||'.');
						DBMS_OUTPUT.PUT_LINE('El nombre del empleado es: '		||nombre||'.');
						DBMS_OUTPUT.PUT_LINE('El apellido del empleado es: '	||apellido||'.');
						DBMS_OUTPUT.PUT_LINE('El salario del empleado es: '		||salario||'.');
					END;

			SELECT employee_id, first_name, last_name, salary
			INTO id,nombre,apellido,salario
			FROM Employees
			WHERE employee_id = EXTERNO.id;
			DBMS_OUTPUT.PUT_LINE('El id del empleado es: '||id||'.');
			DBMS_OUTPUT.PUT_LINE('El nombre del empleado es: '		||nombre||'.');
			DBMS_OUTPUT.PUT_LINE('El apellido del empleado es: '	||apellido||'.');
			DBMS_OUTPUT.PUT_LINE('El salario del empleado es: '		||salario||'.');
		END;
	id:=160;
	SELECT employee_id, first_name, last_name, salary
	INTO id,nombre,apellido,salario
	FROM Employees
	WHERE employee_id = id;
	DBMS_OUTPUT.PUT_LINE('El id del empleado es: '			||id||'.');
	DBMS_OUTPUT.PUT_LINE('El nombre del empleado es: '		||nombre||'.');
	DBMS_OUTPUT.PUT_LINE('El apellido del empleado es: '	||apellido||'.');
	DBMS_OUTPUT.PUT_LINE('El salario del empleado es: '		||salario||'.');
END;