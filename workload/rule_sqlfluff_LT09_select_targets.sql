-- =============================================================================
-- SQLFluff LT09: Select targets formatting (one per line)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT
    SENSOR_ID,
    SENSOR_0,
    SENSOR_1
FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant)
SELECT SENSOR_ID, SENSOR_0, SENSOR_1, SENSOR_2, SENSOR_3, SENSOR_4, SENSOR_5
FROM IOTI_RAW_TB_SENSOR_DATA;
