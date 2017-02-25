DECLARE
 CURSOR jef_emp IS
	SELECT emp.first_name, emp.last_name, emp.hire_date, jef.first_name, jef.last_name, jef.hire_date
	FROM employees emp, employees jef
	WHERE emp.manager_id = jef.employee_id
      		AND
      	emp.hire_date < jef.hire_date;

nombre    Employees.first_name%TYPE;
apellido  Employees.last_name%TYPE;
fech_cont Employees.hire_date%TYPE;
nombre_jef    Employees.first_name%TYPE;
apellido_jef  Employees.last_name%TYPE;
fech_cont_jef Employees.hire_date%TYPE;

BEGIN
 OPEN jef_emp;
   LOOP
    FETCH jef_emp INTO nombre, apellido, fech_cont, nombre_jef, apellido_jef, fech_cont_jef;
    EXIT WHEN jef_emp%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('El nombre del empleado es: '||nombre||' '||apellido);
    DBMS_OUTPUT.PUT_LINE('El nombre de su jefe es: '||nombre_jef||' '||apellido_jef);
    DBMS_OUTPUT.PUT_LINE('Su jefe fue contratado en la fecha: '||fech_cont_jef);
    DBMS_OUTPUT.PUT_LINE('Su empleado fue contratado en la fecha: '||fech_cont);
    DBMS_OUTPUT.PUT_LINE(' ');
   END LOOP;
 CLOSE jef_emp;
END;
