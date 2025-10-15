SELECT ptep_emp,
       ptep_ccar,
       ptep_des004,
       ptep_cbo94,
       PCBOTB.pcbo_cod
FROM PTEPFP_CAR
left join PCBOTB
on PTEPFP_CAR.ptep_cbo = PCBOTB.pcbo_cod
ORDER BY ptep_emp, ptep_ccar