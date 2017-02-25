DECLARE

    nombre     Employees.first_name%TYPE;
    apellido   Employees.last_name%TYPE;
    salario    Employees.salary%TYPE;
    id_emp     Employees.employee_id%TYPE;
    variable   NUMBER(3) :=100;

  BEGIN
    LOOP
        SELECT first_name,last_name,salary
        INTO nombre,apellido,salario
        FROM employees
        WHERE employee_id = variable;
          variable := variable + 1;
          DBMS_OUTPUT.PUT_LINE('Su nombre es: '||nombre||' y su salario es '||TO_CHAR(salario,'$999,999.99'));
          EXIT WHEN variable  >= 207;
    END LOOP;
END;