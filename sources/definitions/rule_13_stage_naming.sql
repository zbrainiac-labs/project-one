-- =============================================================================
-- RULE 13: Stage names must follow {DOM}{COMP}_{MAT}_{ST}_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?STAGE\s+(?:[A-Z0-9_]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_(RAW|CUR|AGG|GOL)_ST_)[A-Z_][A-Z0-9_]*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE STAGE IOTI_RAW_ST_DATA_LANDING;
CREATE STAGE IF NOT EXISTS CRMA_CUR_ST_EXPORT;
CREATE OR REPLACE STAGE PAYA_RAW_ST_INBOUND;
CREATE OR REPLACE STAGE ICGI_RAW_ST_SWIFT_INBOUND FILE_FORMAT = (TYPE = XML);

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE STAGE MY_STAGE;
CREATE STAGE DATA_LANDING;
CREATE OR REPLACE STAGE IOT_INBOUND_STAGE;
CREATE OR REPLACE STAGE ICG_RAW_SWIFT_INBOUND FILE_FORMAT = (TYPE = XML);
