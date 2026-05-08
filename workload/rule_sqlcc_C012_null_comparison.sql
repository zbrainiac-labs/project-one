-- =============================================================================
-- SQLCC:C012: Comparison operator (=, <>, !=) to check if value is null
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_0 IS NULL;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_0 IS NOT NULL;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_0 = NULL;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_0 != NULL;
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_0 <> NULL;
