-- =============================================================================
-- RULE 18: Disallow plaintext passwords in DDL
-- Regex: (?i)^(?!\s*--)\s*.*PASSWORD\s*=\s*'[^']+'
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE USER IF NOT EXISTS SVC_ETL TYPE = SERVICE DEFAULT_ROLE = ETL_ROLE;
CREATE USER SVC_ETL
    LOGIN_NAME = 'SVC_ETL'
    DEFAULT_ROLE = ETL_ROLE;
ALTER USER SVC_ETL SET RSA_PUBLIC_KEY = 'MIIBIjANBg...';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE USER BAD_USER PASSWORD = 'SuperSecret123';
ALTER USER BAD_USER SET PASSWORD = 'NewPassword456';
