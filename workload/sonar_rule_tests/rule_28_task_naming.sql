-- =============================================================================
-- RULE 28: Task names must follow {DOM}{COMP}_{MAT}_TK_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?TASK\s+(?:[A-Z0-9_]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_(RAW|CUR|AGG|GOL)_TK_)[A-Z_][A-Z0-9_]*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TASK IOTI_RAW_TK_REFRESH_DATA
    WAREHOUSE = MD_TEST_WH
    SCHEDULE = 'USING CRON 0 * * * * UTC'
AS SELECT 1;

CREATE OR REPLACE TASK CRMA_CUR_TK_DAILY_SYNC
    WAREHOUSE = MD_TEST_WH
    SCHEDULE = 'USING CRON 0 6 * * * UTC'
AS SELECT 1;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE TASK MY_TASK
    WAREHOUSE = MD_TEST_WH
    SCHEDULE = 'USING CRON 0 * * * * UTC'
AS SELECT 1;

CREATE OR REPLACE TASK REFRESH_IOT_DATA
    WAREHOUSE = MD_TEST_WH
    SCHEDULE = 'USING CRON 0 * * * * UTC'
AS SELECT 1;
