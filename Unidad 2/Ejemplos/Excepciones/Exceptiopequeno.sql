DECLARE
lname VARCHAR2(2);
	little EXCEPTION;
	PRAGMA EXCEPTION_INIT
		(little, -06502);
BEGIN
	SELECT last_name INTO lname
	FROM employees
	WHERE Employee_id = 101;
		DBMS_OUTPUT.PUT_LINE ('John''s last name is : '
		||lname);
		EXCEPTION
			WHEN little THEN
				DBMS_OUTPUT.PUT_LINE('El valor del formato es muy pequeño');
				DBMS_OUTPUT.PUT_LINE(SQLERRM);
	END;
