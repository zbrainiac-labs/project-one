-- =============================================================================
-- RULE 35: Tasks should use SERVERLESS (no WAREHOUSE clause)
-- Single-line regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?TASK\s+.*WAREHOUSE\s*=
-- Multiline regex: (?is)^(?!\s*--)\s*CREATE\s+(?:OR\s+REPLACE\s+)?TASK\s+.*?WAREHOUSE\s*=
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TASK IOTI_RAW_TK_REFRESH_SERVERLESS
    SCHEDULE = 'USING CRON 0 * * * * UTC'
AS SELECT 1;

CREATE OR REPLACE TASK IOTI_RAW_TK_CHILD_TASK
    AFTER IOTI_RAW_TK_REFRESH_SERVERLESS
AS SELECT 1;

-- NEGATIVE TESTS single-line (triggers SimpleRegexMatchCheck)
CREATE OR REPLACE TASK IOTI_RAW_TK_INLINE_WH WAREHOUSE = MD_TEST_WH SCHEDULE = 'USING CRON 0 * * * * UTC' AS SELECT 1;

-- NEGATIVE TESTS multiline (triggers MultilineTextMatchCheck)
CREATE OR REPLACE TASK IOTI_RAW_TK_WITH_WAREHOUSE
    WAREHOUSE = MD_TEST_WH
    SCHEDULE = 'USING CRON 0 * * * * UTC'
AS SELECT 1;
