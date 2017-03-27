DECLARE
	--numero_no_existe EXCEPTION;
	nom_depto	VARCHAR2(20) := 'Ventas';
	num_depto	NUMBER := 101;
BEGIN
	UPDATE departments
	SET department_name = nom_depto
	WHERE department_id = num_depto;
		IF SQL%NOTFOUND THEN
			--RAISE numero_no_existe;
			RAISE_APPLICATION_ERROR(-20202, 'No es un ID válido');
		END IF;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
		RAISE_APPLICATION_ERROR(-20201, 'No es un ID válido');
		--DBMS_OUTPUT.PUT_LINE('El departamento no esta dado de alta');
END;