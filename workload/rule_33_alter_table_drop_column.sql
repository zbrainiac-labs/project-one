-- =============================================================================
-- RULE 33: Disallow ALTER TABLE DROP COLUMN (breaking change)
-- Regex: (?i)^(?!\s*--)\s*ALTER\s+TABLE\s+.*\bDROP\s+(COLUMN\s+)?
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
ALTER TABLE IOTI_RAW_TB_SENSOR_DATA ADD COLUMN NEW_COL NUMBER(10);
ALTER TABLE IOTI_RAW_TB_SENSOR_DATA RENAME COLUMN OLD_COL TO NEW_COL;
ALTER TABLE IOTI_RAW_TB_SENSOR_DATA SET COMMENT = 'Updated comment';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
ALTER TABLE IOTI_RAW_TB_SENSOR_DATA DROP COLUMN SENSOR_11;
ALTER TABLE IOTI_RAW_TB_SENSOR_DATA DROP SENSOR_10;
