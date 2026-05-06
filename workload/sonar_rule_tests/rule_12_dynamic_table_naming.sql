-- =============================================================================
-- RULE 12: Dynamic Table names must follow {DOM}{COMP}_{MAT}_{DT}_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?DYNAMIC\s+TABLE\s+(?:[A-Z0-9_]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_(RAW|CUR|AGG|GOL)_DT_)[A-Z_][A-Z0-9_]*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE DYNAMIC TABLE IOTI_RAW_DT_SENSOR_HOURLY
    TARGET_LAG = '60 MINUTE'
    WAREHOUSE = MD_TEST_WH
AS SELECT 1 AS COL;

CREATE OR REPLACE DYNAMIC TABLE PAYA_AGG_DT_DAILY_TOTALS
    TARGET_LAG = '1 DAY'
    WAREHOUSE = MD_TEST_WH
AS SELECT 1 AS COL;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE DYNAMIC TABLE MY_DYNAMIC_TABLE
    TARGET_LAG = '60 MINUTE'
    WAREHOUSE = MD_TEST_WH
AS SELECT 1 AS COL;

CREATE OR REPLACE DYNAMIC TABLE SENSOR_HOURLY_AGG
    TARGET_LAG = '60 MINUTE'
    WAREHOUSE = MD_TEST_WH
AS SELECT 1 AS COL;
