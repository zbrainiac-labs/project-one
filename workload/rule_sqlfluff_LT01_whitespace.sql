-- =============================================================================
-- SQLFluff LT01: Unnecessary whitespace
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant)
SELECT  SENSOR_ID,  SENSOR_0  FROM  IOTI_RAW_TB_SENSOR_DATA;
SELECT SENSOR_ID ,SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA ;
