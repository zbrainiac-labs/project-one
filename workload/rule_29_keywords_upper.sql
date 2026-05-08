-- =============================================================================
-- RULE 29: SQL keywords must be UPPERCASE
-- Regex: ^\s*\b(select|from|where|join|inner|left|right|outer|full|cross|on|and|or|not|group|order|having|limit|union|intersect|except|insert|update|delete|merge|into|values|set|case|when|then|else|end|as|in|is|like|between|exists|distinct|all|any|with|create|alter|drop|grant|revoke|truncate)\b
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
SELECT SENSOR_ID, SENSOR_0 FROM IOTI_RAW_TB_SENSOR_DATA WHERE SENSOR_ID = 1;
CREATE OR REPLACE TABLE IOTI_RAW_TB_VALID (ID NUMBER(10)) COMMENT = 'Valid';
INSERT INTO IOTI_RAW_TB_SENSOR_DATA VALUES (1, 2.0);
GRANT SELECT ON TABLE IOTI_RAW_TB_DATA TO ROLE ANALYST;

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
select SENSOR_ID from IOTI_RAW_TB_SENSOR_DATA;
create or replace table IOTI_RAW_TB_BAD (ID NUMBER(10)) COMMENT = 'Bad';
insert into IOTI_RAW_TB_SENSOR_DATA values (1, 2.0);
grant select on table IOTI_RAW_TB_DATA to role ANALYST;
