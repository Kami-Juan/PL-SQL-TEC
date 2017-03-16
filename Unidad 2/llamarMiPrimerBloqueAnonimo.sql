DECLARE
	ide				Employees.Employee_id%TYPE;
	nombre_emp	 	Employees.first_name%TYPE;
	apellido_emp 	Employees.last_name%TYPE;
	salario_emp	 	VARCHAR2(20);
	contrata_emp  	VARCHAR2(20);
	numerito		VARCHAR2(100);
BEGIN
        ide:=150;
		consulta_emp(ide,nombre_emp,apellido_emp,salario_emp,contrata_emp,numerito);
		DBMS_OUTPUT.PUT_LINE('Su ID es: '||ide||'.');
		DBMS_OUTPUT.PUT_LINE('Su nombre es: '||nombre_emp||' '||apellido_emp||'.');
		DBMS_OUTPUT.PUT_LINE('Sueldo: '||salario_emp||'.');
		DBMS_OUTPUT.PUT_LINE('Su fecha de contratacion es: '||contrata_emp||'.');
		DBMS_OUTPUT.PUT_LINE('Su fecha de contratacion es: '||numerito||'.');
END;