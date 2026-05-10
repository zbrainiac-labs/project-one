-- =============================================================================
-- RULE 01: Disallow CREATE SCHEMA without IF NOT EXISTS or REPLACE
-- Regex: (?i)^\s*CREATE\s+(?!OR\s+REPLACE\b)(?!.*\bIF\s+NOT\s+EXISTS\b).*?\bSCHEMA\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE SCHEMA IF NOT EXISTS ONE_RAW_v001;
CREATE OR REPLACE SCHEMA ONE_RAW_v001;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule 01: missing IF NOT EXISTS)
-- Also triggers version suffix rule: uppercase _V001 instead of lowercase _v001
CREATE SCHEMA ONE_RAW_V001;
