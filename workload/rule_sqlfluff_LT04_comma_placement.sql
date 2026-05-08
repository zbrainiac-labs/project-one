-- =============================================================================
-- SQLFluff LT04: Comma placement (trailing commas preferred)
-- =============================================================================

-- POSITIVE TESTS (compliant - trailing commas)
SELECT
    SENSOR_ID,
    SENSOR_0,
    SENSOR_1
FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - leading commas)
SELECT
    SENSOR_ID
    ,SENSOR_0
    ,SENSOR_1
FROM IOTI_RAW_TB_SENSOR_DATA;
