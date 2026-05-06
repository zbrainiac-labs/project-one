-- =============================================================================
-- RULE 24: Disallow COPY INTO without ON_ERROR clause
-- Regex: (?i)^(?!\s*--)\s*COPY\s+INTO\s+(?!.*\bON_ERROR\b).*;\s*$
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
COPY INTO IOTI_RAW_TB_SENSOR_DATA FROM @IOTI_RAW_ST_INBOUND FILE_FORMAT = IOTI_RAW_FF_CSV ON_ERROR = 'CONTINUE';
COPY INTO IOTI_RAW_TB_SENSOR_DATA FROM @IOTI_RAW_ST_INBOUND ON_ERROR = 'SKIP_FILE';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
COPY INTO IOTI_RAW_TB_SENSOR_DATA FROM @IOTI_RAW_ST_INBOUND FILE_FORMAT = IOTI_RAW_FF_CSV;
COPY INTO IOTI_RAW_TB_SENSOR_DATA FROM @IOTI_RAW_ST_INBOUND;
COPY INTO IOTI_RAW_TB_SENSOR_DATA FROM @IOTI_RAW_ST_INBOUND/raw_pos/country/;
