-- =============================================================================
-- SQLFluff RF04: Keywords as identifiers
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID, SENSOR_0 AS READING_VALUE FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - using reserved words as identifiers)
SELECT SENSOR_ID, SENSOR_0 AS "SELECT" FROM IOTI_RAW_TB_SENSOR_DATA;
SELECT SENSOR_ID AS "TABLE" FROM IOTI_RAW_TB_SENSOR_DATA;
