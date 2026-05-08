-- =============================================================================
-- SQLFluff ST09: Nested CASE (avoid deeply nested CASE statements)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT
    CASE
        WHEN SENSOR_0 > 100 THEN 'HIGH'
        WHEN SENSOR_0 > 50 THEN 'MEDIUM'
        WHEN SENSOR_0 > 10 THEN 'LOW'
        ELSE 'MINIMAL'
    END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - nested CASE)
SELECT
    CASE
        WHEN SENSOR_0 > 100 THEN 'HIGH'
        ELSE CASE
            WHEN SENSOR_0 > 50 THEN 'MEDIUM'
            ELSE 'LOW'
        END
    END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;
