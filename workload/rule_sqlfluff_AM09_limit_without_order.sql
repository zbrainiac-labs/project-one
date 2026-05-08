-- =============================================================================
-- SQLFluff AM09: LIMIT without ORDER BY
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_ID ASC LIMIT 10;

-- NEGATIVE TESTS (non-compliant)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA LIMIT 10;
