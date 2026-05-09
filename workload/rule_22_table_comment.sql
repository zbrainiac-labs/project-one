-- =============================================================================
-- RULE 22: CREATE TABLE must include COMMENT
-- Single-line regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?TABLE\s+(?!.*\bCOMMENT\b).*;\s*$
-- Multiline regex: (?is)^(?!\s*--)\s*CREATE\s+(?:OR\s+REPLACE\s+)?TABLE\s+.*?;(?!.*\bCOMMENT\b)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_DOCUMENTED (ID NUMBER(10)) COMMENT = 'Well documented table';
CREATE TABLE IF NOT EXISTS IOTI_RAW_TB_WITH_COMMENT (
    ID NUMBER(10),
    NAME VARCHAR(100)
)
COMMENT = 'Has a comment';

-- NEGATIVE TESTS single-line (triggers SimpleRegexMatchCheck)
CREATE OR REPLACE TABLE IOTI_RAW_TB_NO_COMMENT (ID NUMBER(10));

-- NEGATIVE TESTS multiline (triggers MultilineTextMatchCheck)
CREATE OR REPLACE TABLE IOTI_RAW_TB_MISSING_COMMENT (
    ID NUMBER(10),
    NAME VARCHAR(100)
);
