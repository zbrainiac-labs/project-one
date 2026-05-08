-- =============================================================================
-- SQLCC:C022: Non-materialized view found
-- Flags views that could benefit from materialization (e.g. complex joins/aggs)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE DYNAMIC TABLE IOTI_RAW_DT_HOURLY_AVG
    TARGET_LAG = '60 MINUTE'
    WAREHOUSE = MD_TEST_WH
AS
SELECT SENSOR_ID, AVG(SENSOR_0) AS AVG_VAL
FROM IOTI_RAW_TB_SENSOR_DATA
GROUP BY SENSOR_ID;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE VIEW IOTI_RAW_VW_COMPLEX_AGG AS
SELECT SENSOR_ID, AVG(SENSOR_0) AS AVG_VAL, COUNT(*) AS CNT
FROM IOTI_RAW_TB_SENSOR_DATA
GROUP BY SENSOR_ID;
