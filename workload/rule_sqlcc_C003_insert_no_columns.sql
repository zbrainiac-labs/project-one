-- =============================================================================
-- SQLCC:C003: INSERT statement without columns listed
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
INSERT INTO IOTI_RAW_TB_SENSOR_DATA (SENSOR_ID, SENSOR_0) VALUES (1, 2.5);
INSERT INTO IOTI_RAW_TB_SENSOR_DATA (SENSOR_ID, SENSOR_0, SENSOR_1)
    SELECT SENSOR_ID, SENSOR_0, SENSOR_1 FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
INSERT INTO IOTI_RAW_TB_SENSOR_DATA VALUES (1, 2.5, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0);
INSERT INTO IOTI_RAW_TB_SENSOR_DATA SELECT * FROM IOTI_RAW_TB_SENSOR_DATA;
