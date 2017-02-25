DECLARE
	 sueldo		Employees.salary%TYPE;
	 nombre_emp	Employees.first_name%TYPE;
	 apellido_emp	Employees.last_name%TYPE;
	 string 	NUMBER(20);
	 variable 	NUMBER(3) :=100;
BEGIN
 	LOOP
		SELECT first_name, last_name, salary
		INTO nombre_emp, apellido_emp, sueldo
     		FROM Employees
  		WHERE Employee_id = variable;

	string:=
		CASE
			WHEN  sueldo >= 0 AND  sueldo < 5000 THEN 5
			WHEN  sueldo >= 5000 AND sueldo < 10000 THEN 10
			WHEN sueldo >= 10000 AND sueldo < 15000 THEN  15
	        ELSE 20

END;
		variable := variable +1;
        DBMS_OUTPUT.PUT_LINE('Su nombre es: '||nombre_emp||' '||apellido_emp);
        DBMS_OUTPUT.PUT_LINE('El porcentaje de su ISR es: '||string||'%');
        DBMS_OUTPUT.PUT_LINE('Su salario base es de: '||sueldo||' pesos');
        DBMS_OUTPUT.PUT_LINE('Su descuento en pesos es de: '||(sueldo*(string/100)));
		DBMS_OUTPUT.PUT_LINE('Su salario total en pesos es de: '||(sueldo -(sueldo * (string/100))));
        DBMS_OUTPUT.PUT_LINE(' ');
		EXIT WHEN variable >= 207;
	END LOOP;
END;