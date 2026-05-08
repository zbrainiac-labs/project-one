-- =============================================================================
-- SQLFluff ST06: Unnecessary ELSE NULL
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT
    CASE WHEN SENSOR_0 > 100 THEN 'HIGH' END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant)
SELECT
    CASE WHEN SENSOR_0 > 100 THEN 'HIGH' ELSE NULL END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;
