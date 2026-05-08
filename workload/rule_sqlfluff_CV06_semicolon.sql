-- =============================================================================
-- SQLFluff CV06: Statement not terminated with semicolon
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA
