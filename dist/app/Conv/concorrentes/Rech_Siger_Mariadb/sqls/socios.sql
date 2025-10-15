SELECT *
FROM YOEMPR_DTI
WHERE yoem_exr = (SELECT MAX(sub.yoem_exr)
                  FROM YOEMPR_DTI AS sub
				  WHERE YOEMPR_DTI.yoem_sig022 = sub.yoem_sig022 AND YOEMPR_DTI.yoem_cfi022 = sub.yoem_cfi022)
ORDER BY yoem_sig022, yoem_cfi022, yoem_exr, yoem_seqtit 