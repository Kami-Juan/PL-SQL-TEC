DECLARE
    CURSOR calculo_sal IS
      SELECT e.first_name||' '||e.last_name, d.department_name, salary, salario_ventas(employee_id)
      FROM Employees e, Departments d
      WHERE e.department_id = d.department_id AND d.department_name LIKE 'Sales';
        nombre_completo VARCHAR(45);
        nombre_depto    Departments.department_name%TYPE;
        salario_emp     Employees.salary%TYPE;
        salarioBefore     Employees.salary%TYPE;
        BEGIN
          OPEN calculo_sal;
            LOOP
                FETCH calculo_sal INTO nombre_completo, nombre_depto, salarioBefore, salario_emp;
                    DBMS_OUTPUT.PUT_LINE('Su nombre es:'||nombre_completo||'.');
                    DBMS_OUTPUT.PUT_LINE('El nombre de su departmaneto es:'||nombre_depto||'.');
                    DBMS_OUTPUT.PUT_LINE('Su salario sin comision es:'||salarioBefore||'.');
                    DBMS_OUTPUT.PUT_LINE('Su salario total es:'||salario_emp||'.');
                    DBMS_OUTPUT.PUT_LINE('');
                EXIT WHEN calculo_sal%NOTFOUND;
            END LOOP;
          CLOSE calculo_sal;
        END;