-- =============================================================================
-- SQLFluff AM04: SELECT * unknown columns
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID, SENSOR_0, SENSOR_1 FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant)
SELECT * FROM IOTI_RAW_TB_SENSOR_DATA;
