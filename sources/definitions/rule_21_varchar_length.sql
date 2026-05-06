-- =============================================================================
-- RULE 21: Disallow VARCHAR without explicit length
-- Regex: ^(?!\s*--).*\bVARCHAR\s*[^(]
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_VARCHAR_VALID (
    SENSOR_NAME VARCHAR(100),
    DESCRIPTION VARCHAR(500),
    CODE VARCHAR(10)
) COMMENT = 'VARCHAR with explicit lengths';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_VARCHAR_BAD (
    SENSOR_NAME VARCHAR,
    DESCRIPTION VARCHAR
) COMMENT = 'VARCHAR without length';

CREATE OR REPLACE TABLE IOTI_RAW_TB_VARCHAR_TRAILING (
    CITY VARCHAR
) COMMENT = 'VARCHAR with trailing space';
