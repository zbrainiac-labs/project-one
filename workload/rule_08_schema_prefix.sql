-- =============================================================================
-- RULE 08: Schema names must follow {DOMAIN}_{MATURITY}_ prefix pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?SCHEMA\s+(?:IF\s+NOT\s+EXISTS\s+)?(\S+\.)?(?!IF\b)(?!.*_(RAW|CUR|AGG|GOL|REF)_)(?!.*_DCM\b)[A-Z0-9_]+\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE SCHEMA IF NOT EXISTS ONE_RAW_v001;
CREATE OR REPLACE SCHEMA ONE_CUR_v001;
CREATE SCHEMA IF NOT EXISTS ONE_AGG_v001;
CREATE SCHEMA IF NOT EXISTS ONE_GOL_v001;
CREATE SCHEMA IF NOT EXISTS ONE_REF_v001;
CREATE SCHEMA IF NOT EXISTS ONE_DCM;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE SCHEMA IF NOT EXISTS MY_CUSTOM_SCHEMA;
CREATE OR REPLACE SCHEMA STAGING_V001;
CREATE SCHEMA IF NOT EXISTS PUBLIC;
