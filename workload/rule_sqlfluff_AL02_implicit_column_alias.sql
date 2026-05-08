-- =============================================================================
-- SQLFluff AL02: Implicit column alias
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT
    SENSOR_0 + SENSOR_1 AS COMBINED_VALUE,
    COUNT(*) AS ROW_COUNT
FROM IOTI_RAW_TB_SENSOR_DATA
GROUP BY COMBINED_VALUE;

-- NEGATIVE TESTS (non-compliant - expression without alias)
SELECT
    SENSOR_0 + SENSOR_1,
    COUNT(*)
FROM IOTI_RAW_TB_SENSOR_DATA
GROUP BY 1;
