-- =============================================================================
-- SQLCC:C009: Non-sargable statement used
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 100;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_0 > 50.0;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID BETWEEN 1 AND 100;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE UPPER(SENSOR_ID) = '100';
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_0 + 1 > 50;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE LEFT(SENSOR_ID, 2) = '10';
