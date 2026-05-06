-- =============================================================================
-- RULE 04: Disallow GRANT statements to PUBLIC
-- Regex: (?i)^(?!\s*--).*grant\s+.*\s+to\s+public\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
GRANT SELECT ON TABLE IOTI_RAW_TB_DATA TO ROLE ANALYST;
GRANT USAGE ON SCHEMA IOT_RAW_V001 TO ROLE CICD;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
GRANT SELECT ON TABLE IOTI_RAW_TB_DATA TO PUBLIC;
GRANT SELECT ON VIEW IOTI_RAW_VW_SENSORS TO PUBLIC;
GRANT USAGE ON SCHEMA IOT_RAW_V001 TO PUBLIC;
