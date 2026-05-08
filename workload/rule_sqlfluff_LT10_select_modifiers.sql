-- =============================================================================
-- SQLFluff LT10: SELECT modifiers placement (DISTINCT on same line)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT DISTINCT
    SENSOR_ID
FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - DISTINCT on separate line)
SELECT
    DISTINCT SENSOR_ID
FROM IOTI_RAW_TB_SENSOR_DATA;
