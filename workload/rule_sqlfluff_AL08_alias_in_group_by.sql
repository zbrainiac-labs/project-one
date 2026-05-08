-- =============================================================================
-- SQLFluff AL08: Column alias in GROUP BY (use column name, not alias)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID, COUNT(*) AS CNT
FROM IOTI_RAW_TB_SENSOR_DATA
GROUP BY SENSOR_ID;

-- NEGATIVE TESTS (non-compliant - using alias in GROUP BY)
SELECT SENSOR_ID AS ID, COUNT(*) AS CNT
FROM IOTI_RAW_TB_SENSOR_DATA
GROUP BY ID;
