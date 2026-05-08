-- =============================================================================
-- RULE 20: Disallow FLOAT/DOUBLE/REAL -- prefer NUMBER(p,s)
-- Regex: ^(?!\s*--).*\b(FLOAT|DOUBLE|REAL)\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_NUMERIC_VALID (
    PRICE NUMBER(18,4),
    QUANTITY NUMBER(10,0),
    RATIO NUMBER(10,6)
) COMMENT = 'Uses NUMBER type correctly';
CREATE OR REPLACE TABLE IOTI_RAW_TB_NUMBERS_OK (AMOUNT NUMBER(18,2)) COMMENT = 'Single NUMBER col';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE TABLE IOTI_RAW_TB_BAD_FLOAT (SENSOR_VAL FLOAT) COMMENT = 'FLOAT violation';
CREATE OR REPLACE TABLE IOTI_RAW_TB_BAD_DOUBLE (MEASUREMENT DOUBLE) COMMENT = 'DOUBLE violation';
CREATE OR REPLACE TABLE IOTI_RAW_TB_BAD_REAL (READING REAL) COMMENT = 'REAL violation';
