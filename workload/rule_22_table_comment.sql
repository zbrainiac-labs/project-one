-- =============================================================================
-- RULE 22: CREATE TABLE must include COMMENT
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?TABLE\s+(?!.*\bCOMMENT\b).*;\s*$
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_DOCUMENTED (ID NUMBER(10)) COMMENT = 'Well documented table';
CREATE TABLE IF NOT EXISTS IOTI_RAW_TB_WITH_COMMENT (ID NUMBER(10)) COMMENT = 'Has a comment';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_NO_COMMENT (ID NUMBER(10));
CREATE TABLE IF NOT EXISTS IOTI_RAW_TB_MISSING_COMMENT (ID NUMBER(10));
