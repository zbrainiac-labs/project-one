-- =============================================================================
-- SQLFluff CP04: Boolean casing (TRUE/FALSE must be UPPER)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE TRUE;
SELECT CASE WHEN SENSOR_0 > 0 THEN TRUE ELSE FALSE END AS FLAG FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant)
SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA WHERE true;
SELECT CASE WHEN SENSOR_0 > 0 THEN true ELSE false END AS FLAG FROM IOTI_RAW_TB_SENSOR_DATA;
