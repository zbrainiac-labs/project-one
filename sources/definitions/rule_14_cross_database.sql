-- =============================================================================
-- RULE 14: Disallow Cross-Database Dependencies
-- Regex: ^.*cross_db_true.*$
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
-- Normal SQL without cross-database markers
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA;
CREATE OR REPLACE VIEW IOTI_RAW_VW_LOCAL AS SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
-- cross_db_true
SELECT * FROM OTHER_DB.OTHER_SCHEMA.OTHER_TABLE;
