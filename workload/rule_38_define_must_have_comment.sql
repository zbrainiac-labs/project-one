-- =============================================================================
-- RULE: DEFINE TABLE/VIEW/DYNAMIC TABLE must include COMMENT
-- Single-line regex: (?i)^DEFINE\s+(DYNAMIC\s+)?(?:TABLE|VIEW)\s+(?!.*\bCOMMENT\b).*
-- Multiline regex: (?is)^DEFINE\s+(DYNAMIC\s+)?(?:TABLE|VIEW)\s+\S+.*?(?:;|$)(?!.*\bCOMMENT\b)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
DEFINE TABLE {{db}}.{{schema}}.IOTI_RAW_TB_WITH_COMMENT (ID NUMBER(10)) COMMENT = 'Has comment';
DEFINE VIEW {{db}}.{{schema}}.IOTI_RAW_VW_WITH_COMMENT AS SELECT 1 COMMENT = 'Documented';
DEFINE DYNAMIC TABLE {{db}}.{{schema}}.IOTI_RAW_DT_WITH_COMMENT
    TARGET_LAG = '5 MINUTES'
    WAREHOUSE = MD_TEST_WH
    COMMENT = 'Documented'
AS SELECT 1;

-- NEGATIVE TESTS single-line (triggers SimpleRegexMatchCheck)
DEFINE TABLE {{db}}.{{schema}}.IOTI_RAW_TB_NO_COMMENT_INLINE (ID NUMBER(10));

-- NEGATIVE TESTS multiline (triggers MultilineTextMatchCheck)
DEFINE TABLE {{db}}.{{schema}}.IOTI_RAW_TB_NO_COMMENT (
    ID NUMBER(10),
    NAME VARCHAR(100)
);

DEFINE DYNAMIC TABLE {{db}}.{{schema}}.IOTI_RAW_DT_NO_COMMENT
    TARGET_LAG = '5 MINUTES'
    WAREHOUSE = MD_TEST_WH
AS SELECT 1;
