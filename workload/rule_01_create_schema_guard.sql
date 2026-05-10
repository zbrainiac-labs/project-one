-- =============================================================================
-- RULE 01: Disallow CREATE SCHEMA without IF NOT EXISTS or REPLACE
-- Regex: (?i)^\s*CREATE\s+(?!OR\s+REPLACE\b)(?!.*\bIF\s+NOT\s+EXISTS\b).*?\bSCHEMA\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE SCHEMA IF NOT EXISTS RAW_V001;
CREATE OR REPLACE SCHEMA RAW_V001;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE SCHEMA RAW_V001;
