-- =============================================================================
-- RULE 05: Disallow dropping objects without IF EXISTS
-- Regex: (?i)^\s*DROP\s+(SCHEMA|TABLE|VIEW|DYNAMIC\s+TABLE|STAGE|FILE\s+FORMAT|PROCEDURE|FUNCTION|TASK)\s+(?!IF\s+EXISTS\b)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
DROP TABLE IF EXISTS IOTI_RAW_TB_OLD;
DROP VIEW IF EXISTS IOTI_RAW_VW_DEPRECATED;
DROP DYNAMIC TABLE IF EXISTS IOTI_RAW_DT_STALE;
DROP STAGE IF EXISTS IOTI_RAW_ST_TEMP;
DROP SCHEMA IF EXISTS RAW_V000;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
DROP TABLE IOTI_RAW_TB_UNSAFE;
DROP VIEW IOTI_RAW_VW_UNSAFE;
DROP DYNAMIC TABLE IOTI_RAW_DT_UNSAFE;
DROP STAGE IOTI_RAW_ST_UNSAFE;
DROP SCHEMA RAW_V000;
