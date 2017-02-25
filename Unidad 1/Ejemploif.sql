DECLARE

    nombre Employees.first_name%TYPE;
    apellido Employees.last_name%TYPE;
    salario Employees.salary%TYPE;

    BEGIN
        SELECT first_name,last_name,salary
        INTO nombre,apellido,salario
        FROM employees
        WHERE employee_id = 100;

        IF salario > 10000 THEN
          DBMS_OUTPUT.PUT_LINE('Su salario es mayor a 10000');
          DBMS_OUTPUT.PUT_LINE(nombre||' '||apellido||' '||salario||'.');
        ELSE
          DBMS_OUTPUT.PUT_LINE('Su salario es menor o igual a 10000');
          DBMS_OUTPUT.PUT_LINE(nombre||' '||apellido||' '||salario||'.');
        END IF;
END;