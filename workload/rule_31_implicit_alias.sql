-- =============================================================================
-- RULE 31: Implicit alias (missing AS keyword)
-- Regex: (?i)\b(SELECT|FROM|JOIN)\s+.*\)\s+[A-Z_][A-Z0-9_]*\s*[,\n]
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT COUNT(*) AS TOTAL_COUNT FROM IOTI_RAW_TB_SENSOR_DATA;
SELECT SUM(SENSOR_0) AS TOTAL_VALUE FROM IOTI_RAW_TB_SENSOR_DATA;
SELECT (SENSOR_0 + SENSOR_1) AS COMBINED FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT COUNT(*) TOTAL_COUNT,
    SUM(SENSOR_0) TOTAL_VALUE
FROM IOTI_RAW_TB_SENSOR_DATA;

SELECT (SENSOR_0 + SENSOR_1) COMBINED,
    SENSOR_ID
FROM IOTI_RAW_TB_SENSOR_DATA;
