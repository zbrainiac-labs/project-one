-- =============================================================================
-- RULE 37: Stream names must follow DOM+COMP_MAT_SM_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(?:OR\s+REPLACE\s+)?STREAM\s+(?:[A-Z0-9_{}\.]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_(RAW|CUR|AGG|GOL)_SM_)[A-Z_][A-Z0-9_]*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE STREAM IOTI_RAW_SM_SENSOR_CHANGES ON TABLE IOTI_RAW_TB_SENSOR_DATA;
CREATE OR REPLACE STREAM CRMA_CUR_SM_CUSTOMER_CDC ON TABLE CRMA_CUR_TB_CUSTOMERS;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE STREAM MY_STREAM ON TABLE IOTI_RAW_TB_SENSOR_DATA;
CREATE OR REPLACE STREAM SENSOR_CHANGES ON TABLE IOTI_RAW_TB_SENSOR_DATA;
CREATE OR REPLACE STREAM IOT_RAW_STREAM_DATA ON TABLE IOTI_RAW_TB_SENSOR_DATA;
