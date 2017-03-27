CREATE OR REPLACE PROCEDURE depart_employee
(	nombre 		  OUT	VARCHAR2,
	apellido	  OUT	VARCHAR2,
	salario	      OUT	VARCHAR2,
	nombredepart  OUT 	VARCHAR2
)
IS
CURSOR dep_emp IS
      SELECT e.first_name, e.last_name, TO_CHAR(e.salary,'$999,999.99'), d.department_name
      FROM EMPLOYEES e, DEPARTMENTS d
      WHERE d.department_name LIKE 'Sales%';

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
END depart_employee;