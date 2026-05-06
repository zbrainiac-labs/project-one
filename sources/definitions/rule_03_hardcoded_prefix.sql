-- =============================================================================
-- RULE 03: Disallow CREATE statements with hardcoded database and/or schema prefix
-- Regex: (?i)^(?!\s*--)\s*create\s+(or\s+replace\s+)?(table|view|schema)\s+(if\s+not\s+exists\s+)?[a-z0-9_]+\.[a-z0-9_]+(\.[a-z0-9_]+)?
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_CLEAN (ID NUMBER(10)) COMMENT = 'No prefix';
CREATE TABLE IF NOT EXISTS IOTI_RAW_TB_LOCAL (ID NUMBER(10)) COMMENT = 'Local ref';
CREATE OR REPLACE VIEW IOTI_RAW_VW_SIMPLE AS SELECT 1 AS COL;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE TABLE IF NOT EXISTS DATAOPS.IOT_RAW_V001.IOTI_RAW_TB_PREFIXED (ID NUMBER(10)) COMMENT = 'DB prefix';
CREATE OR REPLACE VIEW IOT_RAW_V001.IOTI_RAW_VW_SCHEMA_PREFIX AS SELECT 1 AS COL;
CREATE TABLE DATAOPS.IOT_RAW_V001.IOTI_RAW_TB_FULL_PATH (ID NUMBER(10)) COMMENT = 'Full path';
