SELECT col.BDCODEMP,
       col.BDCODCOL,
       vetd.BDTITELEICOL,
       vetd.BDZONAELEICOL,
       vetd.BDSECAOELEICOL,
       vetdcref.BDREFCOL,
       vetdcref.BDPISCOL,
       vetdcref.BDDATAEMIPISCOL,
       vetdcref.BDRGCOL,
       vetdcref.BDORGEMIRGCOL,
       vetdcref.BDCODUFRG,
       vetdcref.BDCTPSCOL,
       vetdcref.BDSERIECTPSCOL,
       vetdcref.BDDATAEMICTPSCOL,
       vetdcref.BDCODUF,
       vetdcref.BDCNHCOL,
       vetdcref.BDVENCCNHCOL,
       vetdcref.BDCATCNHCOL,
       vetdcref.BDORGAOCNH,
       vetdcref.BDDATAEMICNH,
       vetdcref.BDUFCNH,
       vetc.BDTIPOCOL,
       vetc.BDHORASMENSAISCOL,
       vetc.BDHORASSEMANAISCOL,
       vetc.BDHORASDIARIASCOL,
       vetc.BDPERCADISAL,
       vetf.BDCORCOL,
       vetf.BDDEFFIS,
       vetv.BDCODSINTRAB,
       vetfgts.BDDATAOPCAOFGTSCOL,
       vetfgts.BDCATEGORIACOL,
       vetfgts.BDCATEGORIAESOCIAL
  FROM VRH_EMP_TCOLCON col
  LEFT JOIN VRH_EMP_TCOL_DOC vetd
    ON vetd.BDCODEMP = col.BDCODEMP
   AND vetd.BDCODCOL = col.BDCODCOL
  LEFT JOIN VRH_EMP_TCOLCON_DOCREF vetdcref
    ON vetdcref.BDCODEMP = col.BDCODEMP
   AND vetdcref.BDCODCOL = col.BDCODCOL
   AND vetdcref.BDREFCOL = (SELECT MAX(v.BDREFCOL)
                          FROM VRH_EMP_TCOLCON_DOCREF v
                         WHERE v.BDCODEMP = col.BDCODEMP
                           AND v.BDCODCOL = col.BDCODCOL)
  LEFT JOIN VRHF_EMP_TCOL_CALC vetc
    ON vetc.BDCODEMP = col.BDCODEMP
   AND vetc.BDCODCOL = col.BDCODCOL
   AND vetc.BDREFCOL = (SELECT MAX(v.BDREFCOL)
                          FROM VRHF_EMP_TCOL_CALC v
                         WHERE v.BDCODEMP = col.BDCODEMP
                           AND v.BDCODCOL = col.BDCODCOL)
  LEFT JOIN VRH_EMP_TCOLCON_FIS vetf
    ON vetf.BDCODEMP = col.BDCODEMP
   AND vetf.BDCODCOL = col.BDCODCOL
   AND vetf.BDREFCOL = (SELECT MAX(v.BDREFCOL)
                          FROM VRH_EMP_TCOLCON_FIS v
                         WHERE v.BDCODEMP = col.BDCODEMP
                           AND v.BDCODCOL = col.BDCODCOL)
  LEFT JOIN VRH_EMP_TCOL_VINC vetv
    ON vetv.BDCODEMP = col.BDCODEMP
   AND vetv.BDCODCOL = col.BDCODCOL
   AND vetv.BDREFCOL = (SELECT MAX(v.BDREFCOL)
                          FROM VRH_EMP_TCOL_VINC v
                         WHERE v.BDCODEMP = col.BDCODEMP
                           AND v.BDCODCOL = col.BDCODCOL)
  LEFT JOIN VRHF_EMP_TCOLCON_FGTSGPS vetfgts
    ON vetfgts.BDCODEMP = col.BDCODEMP
   AND vetfgts.BDCODCOL = col.BDCODCOL
   AND vetfgts.BDREFCOL = (SELECT MAX(v.BDREFCOL)
                          FROM VRHF_EMP_TCOLCON_FGTSGPS v
                         WHERE v.BDCODEMP = col.BDCODEMP
                           AND v.BDCODCOL = col.BDCODCOL)
ORDER BY BDCODEMP, BDCODCOL