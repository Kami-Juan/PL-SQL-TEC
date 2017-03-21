CREATE OR REPLACE PROCEDURE commission_emp
(	nombre 		  OUT	VARCHAR2,
	apellido	  OUT	VARCHAR2,
	salario       OUT  	NUMBER,
	comision	  OUT	NUMBER,
    salarioTotal  OUT 	NUMBER
)
IS
CURSOR comm_emp IS
	SELECT e.first_name, e.last_name, e.salary, NVL((e.commission_pct*e.salary),0), NVL((e.salary+(e.salary*e.commission_pct)),0)
	FROM Employees e, Departments d
	WHERE d.department_id = e.department_id
	ORDER BY d.department_name ASC;

BEGIN
	OPEN comm_emp;
		LOOP
	    	FETCH comm_emp INTO nombre, apellido, salario, comision,salarioTotal;
            	DBMS_OUTPUT.PUT_LINE('Su nombre es: '||nombre||' '||apellido||'.');
		        DBMS_OUTPUT.PUT_LINE('Su sueldo sin comisión es: '||salario||'.');
		        DBMS_OUTPUT.PUT_LINE('Su sueldo más comisión es: '||comision||'.');
				DBMS_OUTPUT.PUT_LINE('Su sueldo total es: '||salarioTotal||'.');
      			DBMS_OUTPUT.PUT_LINE('');
		    EXIT WHEN comm_emp%NOTFOUND;
		END LOOP;
	CLOSE comm_emp;
END;