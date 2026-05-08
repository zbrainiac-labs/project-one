-- =============================================================================
-- SQLFluff RF03: Single CASE to IF (unnecessary CASE with one condition)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT IFF(SENSOR_0 > 100, 'HIGH', 'LOW') AS LEVEL FROM IOTI_RAW_TB_SENSOR_DATA;

SELECT
    CASE
        WHEN SENSOR_0 > 100 THEN 'HIGH'
        WHEN SENSOR_0 > 50 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - single-condition CASE)
SELECT
    CASE WHEN SENSOR_0 > 100 THEN 'HIGH' ELSE 'LOW' END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;
