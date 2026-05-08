-- =============================================================================
-- SQLCC:C014: OR verb is used in a WHERE clause
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID IN (1, 2, 3);
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 1
UNION ALL
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 2;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 1 OR SENSOR_ID = 2;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_0 > 50 OR SENSOR_1 > 50;
