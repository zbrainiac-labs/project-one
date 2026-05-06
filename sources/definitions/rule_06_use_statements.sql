-- =============================================================================
-- RULE 06: Disallow hardcoded USE DATABASE, USE SCHEMA, or USE ROLE statements
-- Regex: (?i)^(?!\s*--)\s*USE\s+(DATABASE|SCHEMA|ROLE)\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
-- No USE statements needed in well-structured code
SELECT CURRENT_DATABASE();
SELECT CURRENT_SCHEMA();
SELECT CURRENT_ROLE();

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
USE DATABASE DATAOPS;
USE SCHEMA IOT_RAW_V001;
USE ROLE CICD;
