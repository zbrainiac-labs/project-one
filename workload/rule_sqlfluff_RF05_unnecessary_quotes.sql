-- =============================================================================
-- SQLFluff RF05: Unnecessary quoted identifier
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - unnecessary quoting of simple identifiers)
SELECT "SENSOR_ID", "SENSOR_0" FROM "IOTI_RAW_TB_SENSOR_DATA";
