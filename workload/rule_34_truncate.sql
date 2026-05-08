-- =============================================================================
-- RULE 34: Disallow bare TRUNCATE TABLE (data loss risk)
-- Regex: (?i)^(?!\s*--)\s*TRUNCATE\s+(TABLE\s+)?(?:IF\s+EXISTS\s+)?[A-Z0-9_{}\.]+
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
-- TRUNCATE is always flagged for review; there is no "safe" form.
-- Use DELETE with WHERE clause instead:
DELETE FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID < 0;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
TRUNCATE TABLE IOTI_RAW_TB_SENSOR_DATA;
TRUNCATE TABLE IF EXISTS IOTI_RAW_TB_SENSOR_DATA;
TRUNCATE IOTI_RAW_TB_SENSOR_DATA;
