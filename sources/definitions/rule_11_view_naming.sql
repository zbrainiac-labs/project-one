-- =============================================================================
-- RULE 11: View names must follow {DOM}{COMP}_{MAT}_{VW}_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?VIEW\s+(?:[A-Z0-9_]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_(RAW|CUR|AGG|GOL)_VW_)[A-Z_][A-Z0-9_]*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE VIEW IOTI_RAW_VW_ALL_SENSORS AS SELECT 1 AS COL;
CREATE OR REPLACE VIEW CRMA_CUR_VW_CUSTOMER_360 AS SELECT 1 AS COL;
CREATE OR REPLACE VIEW PAYA_AGG_VW_MONTHLY_SUMMARY AS SELECT 1 AS COL;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE VIEW MY_VIEW AS SELECT 1 AS COL;
CREATE OR REPLACE VIEW SENSOR_LATEST AS SELECT 1 AS COL;
CREATE OR REPLACE VIEW IOT_RAW_READINGS_VW AS SELECT 1 AS COL;
