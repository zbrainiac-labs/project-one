-- =============================================================================
-- RULE: DEFINE TABLE/VIEW/DYNAMIC TABLE must include COMMENT
-- Regex: (?i)^DEFINE\s+(DYNAMIC\s+)?(?:TABLE|VIEW)\s+(?!.*\bCOMMENT\b).*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
DEFINE TABLE {{db}}.{{schema}}.IOTI_RAW_TB_WITH_COMMENT (ID NUMBER(10)) COMMENT = 'Has comment';
DEFINE VIEW {{db}}.{{schema}}.IOTI_RAW_VW_WITH_COMMENT AS SELECT 1 COMMENT = 'Documented';
DEFINE DYNAMIC TABLE {{db}}.{{schema}}.IOTI_RAW_DT_WITH_COMMENT TARGET_LAG = '5 MINUTES' WAREHOUSE = MD_TEST_WH COMMENT = 'Documented' AS SELECT 1;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
DEFINE TABLE {{db}}.{{schema}}.IOTI_RAW_TB_NO_COMMENT (ID NUMBER(10));
DEFINE VIEW {{db}}.{{schema}}.IOTI_RAW_VW_NO_COMMENT AS SELECT 1;
DEFINE DYNAMIC TABLE {{db}}.{{schema}}.IOTI_RAW_DT_NO_COMMENT TARGET_LAG = '5 MINUTES' WAREHOUSE = MD_TEST_WH AS SELECT 1;
