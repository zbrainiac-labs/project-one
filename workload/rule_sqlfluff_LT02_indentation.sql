-- =============================================================================
-- SQLFluff LT02: Indentation
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT
    SENSOR_ID,
    SENSOR_0
FROM IOTI_RAW_TB_SENSOR_DATA
WHERE SENSOR_ID = 1;

-- NEGATIVE TESTS (non-compliant)
SELECT
SENSOR_ID,
SENSOR_0
FROM IOTI_RAW_TB_SENSOR_DATA
WHERE SENSOR_ID = 1;
