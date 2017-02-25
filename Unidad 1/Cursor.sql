DECLARE
 CURSOR salario_emp IS
   SELECT first_name, last_name, salary, department_name
   FROM Employees E, Departments D
   WHERE (E.department_id = D.department_id)
        AND department_name LIKE 'Sales';

nombre    Employees.first_name%TYPE;
apellido  Employees.last_name%TYPE;
salario   Employees.salary%TYPE;
nombre_depto Departments.department_name%TYPE;

BEGIN
 OPEN salario_emp;
   LOOP
    FETCH salario_emp INTO nombre, apellido, salario, nombre_depto;
    EXIT WHEN salario_emp%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(nombre||' '||apellido||', su salario es: '||salario);
   END LOOP;
 CLOSE salario_emp;
END;