DECLARE
	 sueldo		Employees.salary%TYPE;
	 comision	Employees.commission_pct%TYPE;
	 nombre_emp	Employees.first_name%TYPE;
	 apellido_emp	Employees.last_name%TYPE;
	 string 	NUMBER(20);
	 variable 	NUMBER(3) :=100;
BEGIN
 	LOOP
		SELECT first_name, last_name, salary, commission_pct
		INTO nombre_emp, apellido_emp, sueldo, comision
     		FROM Employees
  		WHERE Employee_id = variable;
	string:=
		CASE
			WHEN comision = 0 THEN 0
			WHEN comision >= .10 AND comision < .20 THEN 300
			WHEN comision >= .20 AND comision < .30 THEN 200
			WHEN comision > .30 THEN  100
			ELSE 0
		END;
			variable := variable +1;
	        DBMS_OUTPUT.PUT_LINE('Su nombre es: '||nombre_emp||' '||apellido_emp);
	        DBMS_OUTPUT.PUT_LINE('Su sueldo base es: '||sueldo);
	        DBMS_OUTPUT.PUT_LINE('Su sueldo extra es de: '||NVL(((sueldo+string)*comision),0)||' pesos');
			DBMS_OUTPUT.PUT_LINE('El sueldo total es: '||NVL(((sueldo + string)+((sueldo+string)*comision)),sueldo)||' pesos');
			DBMS_OUTPUT.PUT_LINE('Su comision es de: '||NVL(comision*100,0)||'%');
	        DBMS_OUTPUT.PUT_LINE(' ');
		EXIT WHEN variable >= 207;
	END LOOP;
END;