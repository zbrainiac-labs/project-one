-- =============================================================================
-- RULE 07: Disallow TIMESTAMP_NTZ and TIMESTAMP_LTZ (only TIMESTAMP_TZ allowed)
-- Regex: ^(?!\s*--).*\bTIMESTAMP_(NTZ|LTZ)(\s*\(\s*\d+\s*\))?\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_TS_VALID (
    CREATED_AT TIMESTAMP_TZ,
    UPDATED_AT TIMESTAMP_TZ(9)
) COMMENT = 'Only TIMESTAMP_TZ used';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_TS_NTZ (
    LOAD_TS TIMESTAMP_NTZ
) COMMENT = 'Bad NTZ';

CREATE OR REPLACE TABLE IOTI_RAW_TB_TS_LTZ (
    SESSION_TS TIMESTAMP_LTZ
) COMMENT = 'Bad LTZ';

CREATE OR REPLACE TABLE IOTI_RAW_TB_TS_NTZ_PRECISION (
    EVENT_TS TIMESTAMP_NTZ(9)
) COMMENT = 'Bad NTZ with precision';
