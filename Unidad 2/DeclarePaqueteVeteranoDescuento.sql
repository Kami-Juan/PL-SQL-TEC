DECLARE
  CURSOR salarioDes
  IS
    SELECT e.salary FROM employees e;
  salarito Employees.salary%TYPE;
  descuento Employees.salary%TYPE;
  emploId JOB_HISTORY.EMPLOYEE_ID%type;
  jobId JOB_HISTORY.JOB_ID%TYPE;
  depaId JOB_HISTORY.DEPARTMENT_ID%TYPE;
  jobTi JOBS.JOB_TITLE%TYPE;
BEGIN
  OPEN salarioDes;
  LOOP
    FETCH salarioDes INTO salarito;
    EXIT
  WHEN salarioDes%NOTFOUND;
    descuento:=
    CASE
    WHEN salarito >= 5000 AND salarito < 10000 THEN
      FUNCIONESDESCUENTO.salarySub10(salarito)
    ELSE
      FUNCIONESDESCUENTO.salarySub30(salarito)
    END;
    DBMS_OUTPUT.PUT_LINE(' Aqui está tu descuentón:  '||descuento);
    DBMS_OUTPUT.PUT_LINE(' ');
    
  END LOOP;
  PROCEDIMIENTOVETERANO.EMPLEADOVETERANO(emploId, jobId, depaId, jobTi);
  CLOSE salarioDes;
END;