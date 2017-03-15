CREATE OR REPLACE PROCEDURE consulta_emp
(	id 		 IN OUT		Employees.employee_id%TYPE,
	nombre	 OUT	Employees.first_name%TYPE,
	apellido OUT	Employees.last_name%TYPE,
	salario	 OUT	Employees.salary%TYPE,
	contrata OUT 	Employees.hire_date%TYPE
)
IS
	BEGIN
		SELECT employee_id, first_name, last_name, salary,hire_date
		INTO   id, nombre, apellido, salario,contrata
		FROM Employees
		WHERE employee_id = id;
		DBMS_OUTPUT.PUT_LINE(id||' '||nombre||' '||apellido||' '||salario||' '||contrata);
END;