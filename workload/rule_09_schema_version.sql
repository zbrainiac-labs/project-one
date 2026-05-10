-- =============================================================================
-- RULE 09: Schema names must end with version pattern _vNNN (lowercase v)
-- Regex: case-sensitive, enforces lowercase _v followed by exactly 3 digits
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE SCHEMA IF NOT EXISTS ONE_RAW_v001;
CREATE OR REPLACE SCHEMA ONE_CUR_v002;
CREATE SCHEMA IF NOT EXISTS ONE_AGG_v123;
CREATE SCHEMA IF NOT EXISTS ONE_DCM;

-- NEGATIVE TESTS (non-compliant - MUST trigger version suffix rule)
CREATE SCHEMA IF NOT EXISTS ONE_RAW_LATEST;
CREATE OR REPLACE SCHEMA STAGING_V001;
CREATE SCHEMA IF NOT EXISTS ONE_AGG_v01;
