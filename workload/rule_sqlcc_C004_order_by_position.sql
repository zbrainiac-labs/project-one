-- =============================================================================
-- SQLCC:C004: ORDER BY clause contains positional references
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_ID ASC;
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_0 DESC;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY 1;
SELECT SENSOR_ID, SENSOR_0, SENSOR_1 FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY 2 DESC, 1 ASC;
