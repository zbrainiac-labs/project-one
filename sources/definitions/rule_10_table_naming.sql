-- =============================================================================
-- RULE 10: Table names must follow {DOM}{COMP}_{MAT}_{TB}_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?(?!DYNAMIC\s)TABLE\s+(IF\s+NOT\s+EXISTS\s+)?(?:[A-Z0-9_]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_(RAW|CUR|AGG|GOL)_TB_)[A-Z_][A-Z0-9_]*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_SENSOR_DATA (ID NUMBER(10)) COMMENT = 'Valid IOT table';
CREATE TABLE IF NOT EXISTS CRMA_CUR_TB_CUSTOMERS (ID NUMBER(10)) COMMENT = 'Valid CRM table';
CREATE OR REPLACE TABLE PAYA_AGG_TB_DAILY_TOTALS (ID NUMBER(10)) COMMENT = 'Valid PAY table';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE TABLE MY_TABLE (ID NUMBER(10)) COMMENT = 'Missing naming pattern';
CREATE TABLE IF NOT EXISTS SENSOR_DATA (ID NUMBER(10)) COMMENT = 'No domain prefix';
CREATE OR REPLACE TABLE IOT_RAW_READINGS (ID NUMBER(10)) COMMENT = 'Missing component and TB';
