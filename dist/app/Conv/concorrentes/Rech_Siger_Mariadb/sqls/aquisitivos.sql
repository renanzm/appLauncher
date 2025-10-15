SELECT pfunci.pfun_emp,
       pfunci.pfun_cfi,
       pfunci.pfun_cod,
       pfefun.*
FROM pfefun
INNER JOIN pfunci
ON pfefun.pfef_emp = pfunci.pfun_emp
AND pfefun.pfef_ctr = pfunci.pfun_ctr
ORDER BY 1, 2, 3, 7