-- =============================================================================
-- SQLCC:C015: UNION operator is used (prefer UNION ALL)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 1
UNION ALL
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 2;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 1
UNION
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 2;
