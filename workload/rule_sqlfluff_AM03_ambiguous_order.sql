-- =============================================================================
-- SQLFluff AM03: Ambiguous ORDER BY (column from multiple tables)
-- =============================================================================

-- POSITIVE TESTS (compliant)
SELECT A.SENSOR_ID, B.RECOMMENDED_SIZE
FROM IOTI_RAW_TB_SENSOR_DATA A
JOIN ONEO_RAW_TB_WH_SIZE_RECOMMENDATION B
    ON A.SENSOR_ID = B.BYTES_SCANNED_LOWER
ORDER BY A.SENSOR_ID ASC;

-- NEGATIVE TESTS (non-compliant - ambiguous ORDER BY in multi-table query)
SELECT A.SENSOR_ID, B.RECOMMENDED_SIZE
FROM IOTI_RAW_TB_SENSOR_DATA A
JOIN ONEO_RAW_TB_WH_SIZE_RECOMMENDATION B
    ON A.SENSOR_ID = B.BYTES_SCANNED_LOWER
ORDER BY 1 ASC;
