-- =============================================================================
-- SQLFluff CP02: Identifier casing (must be UPPER)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant)
SELECT sensor_id, sensor_0 FROM ioti_raw_tb_sensor_data;
