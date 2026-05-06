-- =============================================================================
-- RULE 25: Dynamic Tables must specify TARGET_LAG
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?DYNAMIC\s+TABLE\s+(?!.*\bTARGET_LAG\b)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE DYNAMIC TABLE IOTI_RAW_DT_WITH_LAG
    TARGET_LAG = '60 MINUTE'
    WAREHOUSE = MD_TEST_WH
AS SELECT 1 AS COL;

CREATE OR REPLACE DYNAMIC TABLE IOTI_RAW_DT_DOWNSTREAM
    TARGET_LAG = DOWNSTREAM
    WAREHOUSE = MD_TEST_WH
AS SELECT 1 AS COL;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE DYNAMIC TABLE IOTI_RAW_DT_NO_LAG
    WAREHOUSE = MD_TEST_WH
AS SELECT 1 AS COL;
