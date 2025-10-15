SELECT '{codi_emp}' AS CODI_EMP,
       lt.*,
       fp.C8A_CDFPAS,
       fp.C8A_CODTER
  FROM C99{empresa} lt
  LEFT JOIN C8A{empresa} fp
    ON fp.C8A_ID = lt.C99_FPAS
 WHERE lt.C99_NRINES != '';