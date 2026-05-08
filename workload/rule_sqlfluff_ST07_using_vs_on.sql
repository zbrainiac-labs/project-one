-- =============================================================================
-- SQLFluff ST07: USING vs ON in joins (prefer USING when columns match)
-- =============================================================================

-- POSITIVE TESTS (compliant - USING when column names match)
SELECT A.SENSOR_ID, B.RECOMMENDED_SIZE
FROM IOTI_RAW_TB_SENSOR_DATA A
JOIN ONEO_RAW_TB_WH_SIZE_RECOMMENDATION B USING (SENSOR_ID);

-- NEGATIVE TESTS (non-compliant - ON when USING would suffice)
SELECT A.SENSOR_ID, B.RECOMMENDED_SIZE
FROM IOTI_RAW_TB_SENSOR_DATA A
JOIN ONEO_RAW_TB_WH_SIZE_RECOMMENDATION B
    ON A.SENSOR_ID = B.SENSOR_ID;
