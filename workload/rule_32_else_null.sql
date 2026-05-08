-- =============================================================================
-- RULE 32: Unnecessary ELSE NULL in CASE statement
-- Regex: (?i)\bELSE\s+NULL\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT
    CASE WHEN SENSOR_0 > 100 THEN 'HIGH'
         WHEN SENSOR_0 > 50 THEN 'MEDIUM'
    END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;

SELECT
    CASE WHEN SENSOR_0 > 100 THEN 'HIGH'
         ELSE 'LOW'
    END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
SELECT
    CASE WHEN SENSOR_0 > 100 THEN 'HIGH'
         ELSE NULL
    END AS LEVEL
FROM IOTI_RAW_TB_SENSOR_DATA;

SELECT
    CASE WHEN SENSOR_ID = 1 THEN 'FIRST' ELSE NULL END AS LABEL
FROM IOTI_RAW_TB_SENSOR_DATA;
