-- =============================================================================
-- RULE 35: Tasks should use SERVERLESS (no WAREHOUSE clause)
-- Regex: (?i).*CREATE\s+.*TASK\s+.*WAREHOUSE\s*=
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TASK IOTI_RAW_TK_REFRESH_SERVERLESS
    SCHEDULE = 'USING CRON 0 * * * * UTC'
AS SELECT 1;

CREATE OR REPLACE TASK IOTI_RAW_TK_CHILD_TASK
    AFTER IOTI_RAW_TK_REFRESH_SERVERLESS
AS SELECT 1;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE TASK IOTI_RAW_TK_WITH_WAREHOUSE WAREHOUSE = MD_TEST_WH SCHEDULE = 'USING CRON 0 * * * * UTC' AS SELECT 1;
