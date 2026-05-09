-- =============================================================================
-- RULE 24: Disallow COPY INTO without ON_ERROR clause
-- Single-line regex: (?i)^(?!\s*--)\s*COPY\s+INTO\s+(?!.*\bON_ERROR\b).*;\s*$
-- Multiline regex: (?is)^(?!\s*--)\s*COPY\s+INTO\s+.*?;(?!.*\bON_ERROR\b)
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
COPY INTO IOTI_RAW_TB_SENSOR_DATA FROM @IOTI_RAW_ST_INBOUND FILE_FORMAT = IOTI_RAW_FF_CSV ON_ERROR = 'CONTINUE';
COPY INTO IOTI_RAW_TB_SENSOR_DATA
FROM @IOTI_RAW_ST_INBOUND
FILE_FORMAT = IOTI_RAW_FF_CSV
ON_ERROR = 'SKIP_FILE';

-- NEGATIVE TESTS single-line (triggers SimpleRegexMatchCheck)
COPY INTO IOTI_RAW_TB_SENSOR_DATA FROM @IOTI_RAW_ST_INBOUND FILE_FORMAT = IOTI_RAW_FF_CSV;

-- NEGATIVE TESTS multiline (triggers MultilineTextMatchCheck)
COPY INTO IOTI_RAW_TB_SENSOR_DATA
FROM @IOTI_RAW_ST_INBOUND
FILE_FORMAT = IOTI_RAW_FF_CSV;
