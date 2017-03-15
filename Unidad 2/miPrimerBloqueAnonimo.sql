CREATE OR REPLACE PROCEDURE consulta_emp
(	id 		 IN OUT		Employees.employee_id%TYPE,
	nombre	 OUT	Employees.first_name%TYPE,
	apellido OUT	Employees.last_name%TYPE,
	salario	 OUT	VARCHAR2,
	contrata OUT 	VARCHAR2,
	numero   IN OUT VARCHAR2
)
IS
	BEGIN
		SELECT employee_id, first_name, last_name, TO_CHAR(salary,'$999,999.99'),TO_CHAR(hire_date,'DD/MM/YYYY'),phone_number
		INTO   id, nombre, apellido, salario,contrata,numero
		FROM Employees
		WHERE employee_id = id;
		--condicional del formato de teléfono de estados unidos
		IF LENGTH(numero) = 18 THEN
		numero := REPLACE(numero,'.','');
		numero := '+'||SUBSTR(numero,1,3)||'('||SUBSTR(numero,4,2)||')'||SUBSTR(numero
			,6,4)||'-'||SUBSTR(numero,10);
		--condicional del formato de México
		ELSE
		numero := REPLACE(numero,'.','');
		numero := '+521('||SUBSTR(numero,1,3)||')'||SUBSTR(numero,4,3)||'-'||SUBSTR(numero
			,7);
		END IF;
END;