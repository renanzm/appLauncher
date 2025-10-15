select pmvp_emp,
       pmvp_cfi,
       pmvp_cod,
       pmvp_per,
       pmvp_eve,
       pmvp_ref,
       pmvp_val
  from pmvpfp
 where pmvp_tff = 9
   and pmvp_per > (CAST(DATE_FORMAT(NOW(), '%Y%m') as INTEGER) - 300)
 order by pmvp_emp,
          pmvp_cod,
          pmvp_per;