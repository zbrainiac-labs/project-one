-- =============================================================================
-- RULE 36: Semantic View names must follow DOM+COMP_SV_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(?:OR\s+REPLACE\s+)?(?:SECURE\s+)?VIEW\s+(?:[A-Z0-9_{}\.\ ]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_SV_)[A-Z0-9]{4}_SV_
-- Note: This rule only fires on views that contain _SV_ but don't follow the full pattern
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE VIEW IOTI_SV_SENSOR_OVERVIEW AS
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA;

CREATE OR REPLACE SECURE VIEW CRMA_SV_CUSTOMER_360 AS
SELECT 1 AS COL;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE VIEW IOT1_SV_DIGIT_COMPONENT AS SELECT 1 AS COL;
CREATE OR REPLACE VIEW AB12_SV_NUMERIC_SUFFIX AS SELECT 1 AS COL;
