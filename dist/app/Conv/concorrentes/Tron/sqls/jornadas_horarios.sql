SELECT DISTINCT
       jor_emp.CODEMPFOL,
       jor_dia.CODHORTRB,
       jor_dia.CODDIASEM,
       jor_dia.INIHORTRBDIASEM,
       jor_dia.FIMHORTRBDIASEM,
       jor_dia.TIPDIA
  FROM TBLHORTRBCTT jor_emp
 INNER JOIN TBLHORTRBDIASEM jor_dia
    ON jor_dia.CODHORTRB = jor_emp.CODHORTRB
 ORDER BY CODEMPFOL,
          CODHORTRB,
          CODDIASEM