-- =============================================================================
-- RULE 23: Disallow ORDER BY in view definitions
-- Single-line regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?VIEW\b[\s\S]*?\bORDER\s+BY\b
-- Multiline regex: (?is)^(?!\s*--)(?:\s*CREATE\s+(?:OR\s+REPLACE\s+)?|DEFINE\s+)VIEW\b.*?\bORDER\s+BY\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE VIEW IOTI_RAW_VW_NO_ORDER AS
SELECT SENSOR_ID, SENSOR_0
FROM IOTI_RAW_TB_SENSOR_DATA;

-- NEGATIVE TESTS single-line (triggers SimpleRegexMatchCheck)
CREATE OR REPLACE VIEW IOTI_RAW_VW_INLINE_ORDER AS SELECT SENSOR_ID FROM IOTI_RAW_TB_SENSOR_DATA ORDER BY SENSOR_ID;

-- NEGATIVE TESTS multiline (triggers MultilineTextMatchCheck)
CREATE OR REPLACE VIEW IOTI_RAW_VW_WITH_ORDER AS
SELECT SENSOR_ID, SENSOR_0
FROM IOTI_RAW_TB_SENSOR_DATA
ORDER BY SENSOR_ID;
