-- =============================================================================
-- SQLCC:C017: ORDER BY clause does not contain order (ASC/DESC)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_ID ASC;
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_0 DESC;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_ID ASC, SENSOR_0 DESC;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_ID;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_ID, SENSOR_0;
