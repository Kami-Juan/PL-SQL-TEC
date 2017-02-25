DECLARE
CURSOR salario_emp IS
  	SELECT first_name,last_name,salary
  	FROM employees;


	  nombre     Employees.first_name%TYPE;
	  apellido   Employees.last_name%TYPE;
	  salario    Employees.salary%TYPE;
	  string     VARCHAR2(50);


BEGIN
	OPEN salario_emp;
		LOOP
	    	FETCH salario_emp INTO nombre, apellido, salario;

		      string :=
				 CASE
					  WHEN salario >= 0 AND salario < 5000 THEN 'su salario es mayor a 0 y menor a 5000'
					  WHEN salario >= 5000 AND salario < 10000 THEN 'su salario es mayor a 5000 y menor a 10000'
					  WHEN salario >= 10000 AND salario < 15000 THEN 'su salario es mayor a 10000 y menor a 15000'
					  WHEN salario >= 15000 AND salario < 20000 THEN 'su salario es mayor a 15000 y menor a 20000'
					  WHEN salario >= 20000 AND salario < 25000 THEN 'su salario es mayor a 20000 y menor a 25000'
					  ELSE 'es mayor a 25000'
				END;

				DBMS_OUTPUT.PUT_LINE(string||', entonces su salario es: '||TO_CHAR(salario,'$999,999.99'));
		    EXIT WHEN salario_emp%NOTFOUND;
		END LOOP;
	CLOSE salario_emp;
END;