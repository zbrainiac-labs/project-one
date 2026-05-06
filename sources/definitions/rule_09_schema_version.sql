-- =============================================================================
-- RULE 09: Schema names must end with version pattern _vNNN
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?SCHEMA\s+(IF\s+NOT\s+EXISTS\s+)?(?:[a-z0-9_]+\.)?[a-z0-9_]+(?<!_v\d{3});
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE SCHEMA IF NOT EXISTS RAW_V001;
CREATE OR REPLACE SCHEMA CUR_V002;
CREATE SCHEMA IF NOT EXISTS AGG_V123;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE SCHEMA IF NOT EXISTS RAW_LATEST;
CREATE OR REPLACE SCHEMA CUR_PRODUCTION;
CREATE SCHEMA IF NOT EXISTS AGG_V01;
