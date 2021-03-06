SET SQLFORMAT CSV;
SET TERM OFF;
SET VERIFY OFF;
SET FEEDBACK OFF;
SET TRIMSPOOL ON;
-- take output file name from argument 1
DEFINE OUTFILE = '&1'

-- take period from argument 2 and 3
DEFINE WEF = '&2'
DEFINE TIL = '&3'

SPOOL '&OUTFILE';


WITH DATA as (
SELECT * FROM PRUDEV.V_PRU_FAC_TDC_DD
WHERE ENTRY_DATE >= '&WEF' and ENTRY_DATE <'&TIL'
)


SELECT
  TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
  EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
  TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
  ENTRY_DATE as FLT_DATE,
  CASE UNIT_NAME
       WHEN 'EUROCONTROL' THEN 'EUROCONTROL Area (MS)'
       WHEN 'SES Performance Scheme SES-RP1 based on ANSP' THEN 'SES Area (RP1)'
  END ENTITY_NAME,
  'AREA (AUA)' as ENTITY_TYPE,
  TTF_FLT as FLT_ERT_1,
  TDM_ERT as DLY_ERT_1,
  TDM_ERT_A as DLY_ERT_A_1,
  TDM_ERT_C as DLY_ERT_C_1,
  TDM_ERT_D as DLY_ERT_D_1,
  TDM_ERT_E as DLY_ERT_E_1,
  TDM_ERT_G as DLY_ERT_G_1,
  TDM_ERT_I as DLY_ERT_I_1,
  TDM_ERT_M as DLY_ERT_M_1,
  TDM_ERT_N as DLY_ERT_N_1,
  TDM_ERT_O as DLY_ERT_O_1,
  TDM_ERT_P as DLY_ERT_P_1,
  TDM_ERT_R as DLY_ERT_R_1,
  TDM_ERT_S as DLY_ERT_S_1,
  TDM_ERT_T as DLY_ERT_T_1,
  TDM_ERT_V as DLY_ERT_V_1,
  TDM_ERT_W as DLY_ERT_W_1,
  TDM_ERT_NA as DLY_ERT_NA_1
FROM data
WHERE
  (UNIT_PRU_TYPE = 'ZONE' and UNIT_ID IN (58)) OR
  (UNIT_PRU_TYPE = 'ZONE_ANSP' and UNIT_ID IN (55))

UNION ALL

SELECT
  TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
  EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
  TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
  ENTRY_DATE as FLT_DATE,
  CASE UNIT_NAME
       WHEN 'SES Performance Scheme SES-RP2 based on FIR' THEN 'SES Area (RP2)'
  END ENTITY_NAME,
  'AREA (FIR)' as ENTITY_TYPE,
  TTF_FLT as FLT_ERT_1,
  TDM_ERT as DLY_ERT_1,
  TDM_ERT_A as DLY_ERT_A_1,
  TDM_ERT_C as DLY_ERT_C_1,
  TDM_ERT_D as DLY_ERT_D_1,
  TDM_ERT_E as DLY_ERT_E_1,
  TDM_ERT_G as DLY_ERT_G_1,
  TDM_ERT_I as DLY_ERT_I_1,
  TDM_ERT_M as DLY_ERT_M_1,
  TDM_ERT_N as DLY_ERT_N_1,
  TDM_ERT_O as DLY_ERT_O_1,
  TDM_ERT_P as DLY_ERT_P_1,
  TDM_ERT_R as DLY_ERT_R_1,
  TDM_ERT_S as DLY_ERT_S_1,
  TDM_ERT_T as DLY_ERT_T_1,
  TDM_ERT_V as DLY_ERT_V_1,
  TDM_ERT_W as DLY_ERT_W_1,
  TDM_ERT_NA as DLY_ERT_NA_1
FROM DATA
WHERE
  (UNIT_PRU_TYPE = 'ZONE_FIR' and UNIT_ID IN (56))
and ENTRY_DATE >= '1-JAN-2015'

UNION ALL

SELECT
  TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
  EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
  TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
  ENTRY_DATE as FLT_DATE,
  UNIT_NAME as ENTITY_NAME,
  'FAB (FIR)' as ENTITY_TYPE,
  TTF_FLT as FLT_ERT_1,
  TDM_ERT as DLY_ERT_1,
  TDM_ERT_A as DLY_ERT_A_1,
  TDM_ERT_C as DLY_ERT_C_1,
  TDM_ERT_D as DLY_ERT_D_1,
  TDM_ERT_E as DLY_ERT_E_1,
  TDM_ERT_G as DLY_ERT_G_1,
  TDM_ERT_I as DLY_ERT_I_1,
  TDM_ERT_M as DLY_ERT_M_1,
  TDM_ERT_N as DLY_ERT_N_1,
  TDM_ERT_O as DLY_ERT_O_1,
  TDM_ERT_P as DLY_ERT_P_1,
  TDM_ERT_R as DLY_ERT_R_1,
  TDM_ERT_S as DLY_ERT_S_1,
  TDM_ERT_T as DLY_ERT_T_1,
  TDM_ERT_V as DLY_ERT_V_1,
  TDM_ERT_W as DLY_ERT_W_1,
  TDM_ERT_NA as DLY_ERT_NA_1
FROM DATA
WHERE
  UNIT_PRU_TYPE = 'FAB_FIR' and
  UNIT_NAME NOT IN ('BLUE MED FAB (+Albania)') and
  ENTRY_DATE >= '1-JAN-2015'

UNION ALL

SELECT
  TO_CHAR(ENTRY_DATE,'YYYY') as YEAR,
  EXTRACT (MONTH FROM ENTRY_DATE) MONTH_NUM,
  TO_CHAR(ENTRY_DATE,'MON') as MONTH_MON,
  ENTRY_DATE as FLT_DATE,
  UNIT_NAME as ENTITY_NAME,
  'ANSP (AUA)' as ENTITY_TYPE,
  TTF_FLT as FLT_ERT_1,
  TDM_ERT as DLY_ERT_1,
  TDM_ERT_A as DLY_ERT_A_1,
  TDM_ERT_C as DLY_ERT_C_1,
  TDM_ERT_D as DLY_ERT_D_1,
  TDM_ERT_E as DLY_ERT_E_1,
  TDM_ERT_G as DLY_ERT_G_1,
  TDM_ERT_I as DLY_ERT_I_1,
  TDM_ERT_M as DLY_ERT_M_1,
  TDM_ERT_N as DLY_ERT_N_1,
  TDM_ERT_O as DLY_ERT_O_1,
  TDM_ERT_P as DLY_ERT_P_1,
  TDM_ERT_R as DLY_ERT_R_1,
  TDM_ERT_S as DLY_ERT_S_1,
  TDM_ERT_T as DLY_ERT_T_1,
  TDM_ERT_V as DLY_ERT_V_1,
  TDM_ERT_W as DLY_ERT_W_1,
  TDM_ERT_NA as DLY_ERT_NA_1
FROM DATA
WHERE
  UNIT_PRU_TYPE = 'ANSP' and
  UNIT_NAME NOT IN ('NATS','NATS (Oceanic)','HungaroControl',
                    'Avinor (Continental)','Avinor (Oceanic)','NAV Portugal (Santa Maria)',
                    'UNKNOWN','MILITARY','AIRPORT','PIA','BHANSA', 'KFOR (HungaroControl)',
                    'Israel AA', 'ONDA' )
ORDER BY 4,5;


SPOOL OFF;
QUIT
