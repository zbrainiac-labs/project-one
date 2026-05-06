-- =============================================================================
-- RULE 08: Schema names must follow {DOMAIN}_{MATURITY}_ prefix pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?SCHEMA\s+(IF\s+NOT\s+EXISTS\s+)?(?:[a-z0-9_]+\.)?(?!RAW_|CUR_|AGG_|GOL_|REF_)[a-z0-9_]+;
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE SCHEMA IF NOT EXISTS RAW_V001;
CREATE OR REPLACE SCHEMA CUR_V001;
CREATE SCHEMA IF NOT EXISTS AGG_V001;
CREATE SCHEMA IF NOT EXISTS GOL_V001;
CREATE SCHEMA IF NOT EXISTS REF_V001;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE SCHEMA IF NOT EXISTS MY_CUSTOM_SCHEMA;
CREATE OR REPLACE SCHEMA STAGING_V001;
CREATE SCHEMA IF NOT EXISTS PUBLIC;
