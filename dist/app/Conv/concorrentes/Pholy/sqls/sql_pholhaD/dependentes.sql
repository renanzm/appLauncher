SELECT CODEMP,
       CODCAD,
       NOMDEP,
       CODSEX,
       CODVIN,
       DATNAS,
       CARTOR,
       NUMREG,
       DATENT,
       NUMLIV,
       NUMFOL,
       MATRIC,
       NUMCPF,
       DTBXSF,
       DTBXIR,
       LOCNAS
FROM PHCDEP
WHERE NOMDEP != ''
ORDER BY 1, 2, 6