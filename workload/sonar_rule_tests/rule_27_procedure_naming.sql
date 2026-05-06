-- =============================================================================
-- RULE 27: Stored Procedure names must follow {DOM}{COMP}_{MAT}_SP_ pattern
-- Regex: (?i)^(?!\s*--)\s*CREATE\s+(OR\s+REPLACE\s+)?PROCEDURE\s+(?:[A-Z0-9_]+\.){0,2}(?![A-Z0-9]{3}[A-Z]_(RAW|CUR|AGG|GOL)_SP_)[A-Z_][A-Z0-9_]*
-- =============================================================================

-- POSITIVE TESTS (compliant - must NOT trigger rule)
CREATE OR REPLACE PROCEDURE IOTI_RAW_SP_LOAD_DATA()
RETURNS VARCHAR(100)
LANGUAGE SQL
AS 'SELECT 1';

CREATE OR REPLACE PROCEDURE CRMA_CUR_SP_MERGE_CUSTOMERS()
RETURNS VARCHAR(100)
LANGUAGE SQL
AS 'SELECT 1';

-- NEGATIVE TESTS (non-compliant - MUST trigger rule)
CREATE OR REPLACE PROCEDURE LOAD_DATA()
RETURNS VARCHAR(100)
LANGUAGE SQL
AS 'SELECT 1';

CREATE OR REPLACE PROCEDURE SP_PROCESS_RECORDS()
RETURNS VARCHAR(100)
LANGUAGE SQL
AS 'SELECT 1';
