-- =============================================================================
-- SQLFluff AL01: Missing AS keyword (implicit alias)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID AS ID, SENSOR_0 AS VALUE FROM IOTI_RAW_TB_SENSOR_DATA AS T;

-- NEGATIVE TESTS (non-compliant)
SELECT SENSOR_ID ID, SENSOR_0 VALUE FROM IOTI_RAW_TB_SENSOR_DATA T;
