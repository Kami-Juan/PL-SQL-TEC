CREATE OR REPLACE PROCEDURE depart_employee
(	nombre 		  OUT	VARCHAR2,
	apellido	  OUT	VARCHAR2,
	salario	      OUT	NUMBER,
	nombredepart  OUT 	VARCHAR2
)
IS
CURSOR dep_emp IS
      SELECT e.first_name, e.last_name, e.salary, d.department_name
      FROM EMPLOYEES e, DEPARTMENTS d
      WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID;

BEGIN
	OPEN dep_emp;
		LOOP
	    	FETCH dep_emp INTO nombre, apellido, salario, nombredepart;
            		DBMS_OUTPUT.PUT_LINE('Su nombre es: '||nombre||' '||apellido||'.');
                	DBMS_OUTPUT.PUT_LINE('Sueldo: '||salario||'.');
                	DBMS_OUTPUT.PUT_LINE('Su departamento es: '||nombredepart||'.');
					DBMS_OUTPUT.PUT_LINE('');
		    EXIT WHEN dep_emp%NOTFOUND;
		END LOOP;
	CLOSE dep_emp;
END;