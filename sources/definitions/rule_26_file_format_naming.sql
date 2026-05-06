-- =============================================================================
-- RULE 26: File Format names must follow {DOM}{COMP}_{MAT}_FF_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?FILE\s+FORMAT\s+(?:[A-Z0-9_]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_(RAW|CUR|AGG|GOL)_FF_)[A-Z_][A-Z0-9_]*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE FILE FORMAT IOTI_RAW_FF_CSV TYPE = CSV FIELD_DELIMITER = ',';
CREATE OR REPLACE FILE FORMAT CRMA_CUR_FF_JSON TYPE = JSON;
CREATE OR REPLACE FILE FORMAT PAYA_RAW_FF_PARQUET TYPE = PARQUET;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE FILE FORMAT MY_CSV_FORMAT TYPE = CSV;
CREATE OR REPLACE FILE FORMAT CSV_LOADER TYPE = CSV;
CREATE OR REPLACE FILE FORMAT IOT_FILE_FORMAT TYPE = JSON;
