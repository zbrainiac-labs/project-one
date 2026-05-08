-- =============================================================================
-- RULE 30: JOIN without ON clause (potential cartesian join)
-- Regex: (?i)\bJOIN\s+\S+\s*$
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT A.ID, B.NAME
FROM IOTI_RAW_TB_SENSOR_DATA A
JOIN IOTI_RAW_TB_WH_SIZE_RECOMMENDATION B ON A.SENSOR_ID = B.BYTES_SCANNED_LOWER;

SELECT A.ID
FROM IOTI_RAW_TB_SENSOR_DATA A
LEFT JOIN IOTI_RAW_TB_WH_SIZE_RECOMMENDATION B ON A.SENSOR_ID = B.BYTES_SCANNED_LOWER;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT A.ID, B.NAME
FROM IOTI_RAW_TB_SENSOR_DATA A
JOIN IOTI_RAW_TB_WH_SIZE_RECOMMENDATION
WHERE A.SENSOR_ID = 1;

SELECT A.ID
FROM IOTI_RAW_TB_SENSOR_DATA A
LEFT JOIN IOTI_RAW_TB_WH_SIZE_RECOMMENDATION
WHERE A.SENSOR_ID > 0;
