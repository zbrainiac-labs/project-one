-- =============================================================================
-- RULE 02: Disallow CREATE TABLE without IF NOT EXISTS or REPLACE
-- Regex: (?is)^(?!\s*--).*CREATE\s+(?!OR\s+REPLACE\b|.*IF\s+NOT\s+EXISTS\b).*TABLE\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_VALID (ID NUMBER(10)) COMMENT = 'Valid table';
CREATE TABLE IF NOT EXISTS IOTI_RAW_TB_VALID2 (ID NUMBER(10)) COMMENT = 'Valid table';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE TABLE IOT_RAW_TB_MISSING_GUARD (ID NUMBER(10)) COMMENT = 'Missing guard';
