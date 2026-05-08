-- =============================================================================
-- SQLCC:C023: Cartesian join found (missing JOIN condition)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT A.SENSOR_ID, B.RECOMMENDED_SIZE
FROM IOTI_RAW_TB_SENSOR_DATA A
JOIN ONEO_RAW_TB_WH_SIZE_RECOMMENDATION B ON A.SENSOR_ID = B.BYTES_SCANNED_LOWER;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT A.SENSOR_ID, B.RECOMMENDED_SIZE
FROM IOTI_RAW_TB_SENSOR_DATA A, ONEO_RAW_TB_WH_SIZE_RECOMMENDATION B;

SELECT A.SENSOR_ID, B.RECOMMENDED_SIZE
FROM IOTI_RAW_TB_SENSOR_DATA A
CROSS JOIN ONEO_RAW_TB_WH_SIZE_RECOMMENDATION B;
