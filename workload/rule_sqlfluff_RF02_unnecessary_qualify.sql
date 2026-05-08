-- =============================================================================
-- SQLFluff RF02: Unnecessary qualified references
-- =============================================================================

-- POSITIVE TESTS (compliant - single table, no need to qualify)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - over-qualified with single table)
SELECT
    IOTI_RAW_TB_SENSOR_DATA.SENSOR_ID,
    IOTI_RAW_TB_SENSOR_DATA.SENSOR_0
FROM IOTI_RAW_TB_SENSOR_DATA;
