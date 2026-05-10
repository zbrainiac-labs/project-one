-- =============================================================================
-- SQLFluff LT08: CTE bracket newline
-- =============================================================================

-- POSITIVE TESTS (compliant)
WITH CTE AS (
    SELECT SENSOR_ID, SENSOR_0
    FROM IOTI_RAW_TB_SENSOR_DATA
)
SELECT SENSOR_ID, SENSOR_0 FROM CTE;

-- NEGATIVE TESTS (non-compliant - bracket on same line as AS)
WITH CTE AS
(SELECT SENSOR_ID, SENSOR_0
FROM IOTI_RAW_TB_SENSOR_DATA)
SELECT SENSOR_ID, SENSOR_0 FROM CTE;
