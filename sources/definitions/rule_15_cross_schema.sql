-- =============================================================================
-- RULE 15: Disallow Cross-Schema Dependencies
-- Regex: ^.*cross_schema_true.*$
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
-- Normal SQL without cross-schema markers
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA;
CREATE OR REPLACE VIEW IOTI_RAW_VW_SAME_SCHEMA AS SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
-- cross_schema_true
CREATE OR REPLACE VIEW IOTI_RAW_VW_CROSS_SCHEMA AS
SELECT IOT.SENSOR_ID, GEO.CITY FROM IOTI_RAW_TB_SENSOR_DATA IOT
JOIN REF_RAW_V001.REFA_RAW_TB_GEOLOC GEO ON IOT.SENSOR_ID = GEO.SENSOR_ID;
