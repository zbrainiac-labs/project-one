-- =============================================================================
-- SQLCC:C002: SELECT * is used
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT SENSOR_ID, SENSOR_0, SENSOR_1 FROM IOTI_RAW_TB_SENSOR_DATA;
SELECT COUNT(*) FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT * FROM IOTI_RAW_TB_SENSOR_DATA;
SELECT * FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 1;
