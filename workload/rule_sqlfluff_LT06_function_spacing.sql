-- =============================================================================
-- SQLFluff LT06: Function name spacing
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT COUNT(*) AS CNT FROM IOTI_RAW_TB_SENSOR_DATA;
SELECT AVG(SENSOR_0) AS AVG_VAL FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - space before parenthesis)
SELECT COUNT (*) AS CNT FROM IOTI_RAW_TB_SENSOR_DATA;
SELECT AVG (SENSOR_0) AS AVG_VAL FROM IOTI_RAW_TB_SENSOR_DATA;
