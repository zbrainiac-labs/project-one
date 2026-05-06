-- =============================================================================
-- RULE 17: Disallow ACCOUNTADMIN usage in SQL scripts
-- Regex: (?i)^(?!\s*--)\s*(USE\s+ROLE|SET\s+ROLE|GRANT\s+.*TO\s+ROLE|GRANT\s+ROLE)\s+.*\bACCOUNTADMIN\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
USE ROLE CICD;
GRANT SELECT ON TABLE IOTI_RAW_TB_DATA TO ROLE ANALYST;
GRANT ROLE CICD TO USER SVC_CICD;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
USE ROLE ACCOUNTADMIN;
GRANT ROLE CICD TO ROLE ACCOUNTADMIN;
GRANT ALL PRIVILEGES ON ACCOUNT TO ROLE ACCOUNTADMIN;
GRANT ROLE ACCOUNTADMIN TO USER SOME_USER;
