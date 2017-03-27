CREATE OR REPLACE PACKAGE packISR IS
    PROCEDURE calcular_ISR_procedure
		(nombre_completo OUT VARCHAR2,
		 salario_emp OUT NUMBER,
		 total_isr OUT NUMBER,
		 total_salario OUT NUMBER);
END packISR;