# SonarQube Issues Report — project-one

**Total Issues: 8313** | **Total Rules: 93+6** (47 txt + 20 SQLCC + 26 SQLFluff + 6 multiline)  
**Scan Date: 2026-05-09 (Run #34 — all 40 txt: rules + 6 multiline rules active and verified)**

---

## Summary by Rule Category

| Category | Rules Available | Rules Triggered | Rules Tested | Issues |
|----------|---------------|-----------------|--------------|--------|
| SonarQube Text Plugin (txt:) | 47 | 40 | 37 | 7460 |
| SQL Code Checker (SQLCC:) | 20 | 12 | 13 | 91 |
| SQLFluff (external) | 26 | 26 | 26 | 762 |
| **Total** | **93** | **78** | **76** | **8313** |

---

## Community Text Plugin Rules (txt:) — 47 rules, 6892 issues

| # | Rule Key | Description | Severity | Issues | Tested |
|---|----------|-------------|----------|--------|--------|
| 1 | txt:Disallow_FLOAT_DOUBLE | Disallow FLOAT/DOUBLE/REAL -- prefer NUMBER(p,s) | MAJOR | 51 | ✓ `rule_20` |
| 2 | txt:Keywords_must_be_UPPER | SQL keywords must be UPPERCASE | MINOR | 5082 | ✓ `rule_29` |
| 3 | txt:Disallow_VARCHAR_without_length | Disallow VARCHAR without explicit length | MINOR | 22 | ✓ `rule_21` |
| 4 | txt:Disallow_usage_of_TIMESTAMP_types_other_than_TIMESTAMP_TZ | Disallow TIMESTAMP_NTZ and TIMESTAMP_LTZ | MAJOR | 11 | ✓ `rule_07` |
| 5 | txt:Disallow_hardcoded_Use_DATABASE__SCHEMA__or_ROLE_statements | Disallow hardcoded USE DATABASE, SCHEMA, or ROLE | CRITICAL | 172 | ✓ `rule_06` |
| 6 | txt:Disallow_Cross_Schema_Dependencies | Disallow Cross-Schema Dependencies | CRITICAL | 3 | ✓ `rule_15` |
| 7 | txt:Cross_Database_Dependencies | Disallow Cross-Database Dependencies | CRITICAL | 3 | ✓ `rule_14` |
| 8 | txt:Table_names_must_begin_with_a_3_character_alphanumeric_component_code | Table names must begin with 3-char component code | MAJOR | 2 | ✓ `rule_10` |
| 9 | txt:JOIN_without_ON_clause | JOIN without ON clause | MAJOR | 9 | ✓ `rule_30` |
| 10 | txt:Implicit_alias_missing_AS | Implicit alias (missing AS keyword) | MINOR | 303 | ✓ `rule_31` |
| 11 | txt:Unnecessary_ELSE_NULL | Unnecessary ELSE NULL in CASE | MINOR | 11 | ✓ `rule_32` |
| 12 | txt:Dynamic_Table_must_have_TARGET_LAG_multiline | Dynamic Tables must specify TARGET_LAG (multiline) | CRITICAL | 15 | ✓ `rule_25` |
| 13 | txt:DEFINE_must_have_COMMENT_multiline | DEFINE must include COMMENT (multiline) | MAJOR | 13 | ✓ `rule_38` |
| 14 | txt:Disallow_ALTER_TABLE_DROP_COLUMN | Disallow ALTER TABLE DROP COLUMN (breaking change) | CRITICAL | 0 | ✓ `rule_33` |
| 15 | txt:Disallow_TRUNCATE_without_safeguard | Disallow bare TRUNCATE TABLE (data loss risk) | CRITICAL | 0 | ✓ `rule_34` |
| 16 | txt:Task_must_be_SERVERLESS | Tasks should use SERVERLESS (no WAREHOUSE clause) | MAJOR | 0 | ✓ `rule_35` |
| 17 | txt:Semantic_View_name_pattern | Semantic View names must follow DOM+COMP_SV_ pattern | MAJOR | 0 | ✓ `rule_36` |
| 18 | txt:Stream_name_pattern | Stream names must follow DOM+COMP_MAT_SM_ pattern | MAJOR | 75 | ✓ `rule_37` |
| 19 | txt:Stored_Procedure_name_pattern | Stored Procedure names must follow DOM+COMP_MAT_SP_ pattern | MAJOR | 75 | ✓ `rule_27` |
| 20 | txt:File_Format_name_pattern | File Format names must follow DOM+COMP_MAT_FF_ pattern | MAJOR | 75 | ✓ `rule_26` |
| 21 | txt:Stage_name_pattern | Stage names must follow DOM+COMP_MAT_ST_ pattern | MAJOR | 75 | ✓ `rule_13` |
| 22 | txt:Task_name_pattern | Task names must follow DOM+COMP_MAT_TK_ pattern | MAJOR | 75 | ✓ `rule_28` |
| 23 | txt:View_name_pattern | View names must follow DOM+COMP_MAT_VW_ pattern | MAJOR | 75 | ✓ `rule_11` |
| 24 | txt:Dynamic_Table_name_pattern | Dynamic Table names must follow DOM+COMP_MAT_DT_ pattern | MAJOR | 75 | ✓ `rule_12` |
| 25 | txt:Table_name_pattern | Table names must follow DOM+COMP_MAT_TB_ pattern | MAJOR | 75 | ✓ `rule_10` |
| 26 | txt:CREATE_TABLE_must_have_COMMENT | CREATE TABLE must include COMMENT | MINOR | 0 | ✓ `rule_22` |
| 27 | txt:Schema_must_have_version_suffix | Schema names must end with _vNNN version | MAJOR | 0 | ✓ `rule_09` |
| 28 | txt:Schema_must_have_maturity_prefix | Schema names must follow DOMAIN_MATURITY_ prefix | MAJOR | 76 | ✓ `rule_08` |
| 29 | txt:Disallow_CREATE_SCHEMA_without_IF_NOT_EXISTS | Disallow CREATE SCHEMA without IF NOT EXISTS or REPLACE | MAJOR | 0 | ✓ `rule_01` |
| 30 | txt:Disallow_CREATE_TABLE_without_IF_NOT_EXISTS_or_REPLACE | Disallow CREATE TABLE without IF NOT EXISTS or REPLACE | MAJOR | 0 | ✓ `rule_02` |
| 31 | txt:Disallow_CREATE_statements_with_hardcoded_database_or_schema_prefix | Disallow CREATE with hardcoded database/schema prefix | MAJOR | 171 | ✓ `rule_03` |
| 32 | txt:Disallow_ORDER_BY_in_views | Disallow ORDER BY in view definitions | MAJOR | 0 | ✓ `rule_23` |
| 33 | txt:Disallow_dropping_objects_without_IF_EXISTS | Disallow dropping objects without IF EXISTS | MAJOR | 322 | ✓ `rule_05` |
| 34 | txt:Disallow_COPY_INTO_without_ON_ERROR | Disallow COPY INTO without ON_ERROR clause | MAJOR | 0 | ✓ `rule_24` |
| 35 | txt:Disallow_GRANT_Statements_to_PUBLIC | Disallow GRANT Statements to PUBLIC | CRITICAL | 0 | ✓ `rule_04` |
| 36 | txt:Disallow_GRANT_ALL_PRIVILEGES | Disallow GRANT ALL PRIVILEGES | MAJOR | 0 | ✓ `rule_16` |
| 37 | txt:Disallow_ACCOUNTADMIN_in_scripts | Disallow ACCOUNTADMIN usage in SQL scripts | CRITICAL | 0 | ✓ `rule_17` |
| 38 | txt:Disallow_plaintext_passwords | Disallow plaintext passwords in DDL | BLOCKER | 0 | ✓ `rule_18` |
| 39 | txt:Disallow_SELECT_star | Disallow SELECT * (force explicit column lists) | MINOR | 0 | ✓ `rule_19` |
| 40 | txt:Enforce__maturity_level__Code_at_Positions_5_7 | Enforce maturity-level code at positions 5-7 | CRITICAL | 54 | ✓ `rule_08` |
| 41 | txt:DEFINE_must_have_COMMENT | DEFINE TABLE/VIEW/DT must include COMMENT | MAJOR | 0 | ✓ `rule_22` |
| 42 | txt:Dynamic_Table_must_have_TARGET_LAG | Dynamic Tables must specify TARGET_LAG | MAJOR | 0 | ✓ `rule_25` |
| 43 | txt:MultiFileIfOneStringExistsThenBothMustExistCheck | Cross-file string presence check (template) | MAJOR | 0 | — |
| 44 | txt:MultilineTextMatchCheck | Multiline Regex Check (template) | MAJOR | 0 | — |
| 45 | txt:SimpleRegexMatchCheck | Simple Regex Match (template) | MAJOR | 0 | — |
| 46 | txt:StringDisallowedIfMatchInAnotherFileCheck | String disallowed if match in another file (template) | MAJOR | 0 | — |
| 47 | txt:RequiredStringNotPresentRegexMatchCheck | Required String not Present (template) | MAJOR | 0 | — |

---

## SQL Code Checker Rules (SQLCC:) — 20 rules, 87 issues

| # | Rule Key | Description | Severity | Issues | Tested |
|---|----------|-------------|----------|--------|--------|
| 1 | SQLCC:C022 | Non-materialized view found | MAJOR | 35 | ✓ |
| 2 | SQLCC:C030 | File does not start with multiline/header comment | MINOR | 8 | ✓ |
| 3 | SQLCC:C017 | ORDER BY clause does not contain order (ASC/DESC) | MINOR | 8 | ✓ |
| 4 | SQLCC:C002 | SELECT * is used | MINOR | 10 | ✓ |
| 5 | SQLCC:C009 | Non-sargable statement used | MAJOR | 6 | ✓ |
| 6 | SQLCC:C003 | INSERT statement without columns listed | MINOR | 5 | ✓ |
| 7 | SQLCC:C023 | Cartesian join found | MAJOR | 3 | ✓ |
| 8 | SQLCC:C012 | Comparison operator (=, <>) to check if value is null | MAJOR | 4 | ✓ |
| 9 | SQLCC:C001 | SLEEP/WAITFOR is used (SQL Server only) | MINOR | 0 | n/a |
| 10 | SQLCC:C004 | ORDER BY clause contains positional references | MINOR | 3 | ✓ |
| 11 | SQLCC:C005 | EXECUTE/EXEC for dynamic query is used (SQL Server only) | MINOR | 0 | n/a |
| 12 | SQLCC:C007 | NOLOCK hint used (SQL Server only) | MINOR | 0 | n/a |
| 13 | SQLCC:C010 | Primary key not using recommended naming convention (SQL Server) | MINOR | 0 | n/a |
| 14 | SQLCC:C011 | Foreign key not using recommended naming convention (SQL Server) | MINOR | 0 | n/a |
| 15 | SQLCC:C013 | Index name not using recommended naming convention (SQL Server) | MINOR | 0 | n/a |
| 16 | SQLCC:C014 | OR verb is used in a WHERE clause | MAJOR | 2 | ✓ |
| 17 | SQLCC:C015 | UNION operator is used | MAJOR | 1 | ✓ |
| 18 | SQLCC:C016 | IN/NOT IN is used for a subquery | MAJOR | 2 | ✓ |
| 19 | SQLCC:C020 | HINT is used (SQL Server only) | MINOR | 0 | n/a |
| 20 | SQLCC:C021 | COMMIT is missing (SQL Server only) | MINOR | 0 | n/a |

---

## SQLFluff Rules (external) — 26 rules, 757 issues

| # | Rule | Description | Severity | Issues | Tested |
|---|------|-------------|----------|--------|--------|
| 1 | LT01 | Unnecessary whitespace | INFO | 231 | ✓ |
| 2 | LT02 | Indentation | INFO | 138 | ✓ |
| 3 | AL01 | Missing AS keyword (implicit alias) | MINOR | 22 | ✓ |
| 4 | CP02 | Identifier casing | MINOR | 18 | ✓ |
| 5 | LT09 | Select targets formatting | INFO | 14 | ✓ |
| 6 | AM05 | JOIN without ON clause | MAJOR | 12 | ✓ |
| 7 | LT04 | Comma placement | INFO | 10 | ✓ |
| 8 | RF04 | Keywords as identifiers | MAJOR | 9 | ✓ |
| 9 | AM04 | SELECT * unknown columns | MINOR | 9 | ✓ |
| 10 | LT08 | CTE bracket newline | INFO | 9 | ✓ |
| 11 | LT12 | EOF newline | INFO | 8 | ✓ |
| 12 | RF05 | Unnecessary quoted identifier | MINOR | 6 | ✓ |
| 13 | RF03 | Single CASE to IF | MINOR | 5 | ✓ |
| 14 | CV06 | Statement not terminated with semicolon | MINOR | 4 | ✓ |
| 15 | ST06 | Unnecessary ELSE NULL | MINOR | 4 | ✓ |
| 16 | LT06 | Function name spacing | INFO | 3 | ✓ |
| 17 | RF02 | Unnecessary qualified references | MINOR | 3 | ✓ |
| 18 | LT14 | Inconsistent line endings | INFO | 3 | ✓ |
| 19 | AM09 | LIMIT without ORDER BY | MINOR | 3 | ✓ |
| 20 | AM03 | Ambiguous ORDER BY | MINOR | 2 | ✓ |
| 21 | AL02 | Implicit column alias | MINOR | 2 | ✓ |
| 22 | LT10 | SELECT modifiers placement | INFO | 2 | ✓ |
| 23 | CP04 | Boolean casing | MINOR | 1 | ✓ |
| 24 | ST09 | Nested CASE | MINOR | 1 | ✓ |
| 25 | AL08 | Column alias in GROUP BY | MINOR | 1 | ✓ |
| 26 | ST07 | USING vs ON in joins | MINOR | 1 | ✓ |

---

## Test Coverage Summary

### project-one (this repo)

| Test Location | Covers | Files |
|---------------|--------|-------|
| `workload/rule_01_*.sql` — `rule_28_*.sql` | Rules 01-28 (positive + negative regex tests) | 28 files |
| `workload/rule_29_*.sql` — `rule_37_*.sql` | Rules 29-37: style, safety, naming (positive + negative) | 9 files |
| `workload/rule_test_*.sql` | Rules 01-28 grouped by category | 7 files |
| `workload/rule_sqlcc_*.sql` | SQLCC rules C002-C023, C030 (positive + negative) | 13 files |
| `workload/rule_sqlfluff_*.sql` | SQLFluff rules (all 26 rules, positive + negative) | 26 files |
| `sqlunit/tests.sqltest` | Rules 04, 07, 10-13, 20-22, 25 (runtime INFORMATION_SCHEMA checks) | 1 file |

### DataOpsBackbone (upstream — shared infrastructure)

| Test Location | Covers | Files |
|---------------|--------|-------|
| `sqlfluff/test_sql/good_example.sql` | Compliant SQL for rules 01, 02, 05, 07, 13, 22, 24, 25, 26 | 1 file |
| `sqlfluff/test_sql/bad_example.sql` | Non-compliant SQL for rules 01-07, 16-22, 25 (15 rules) | 1 file |
| `sqlfluff/plugins/dataops_rules/` | DO01-DO28 as SQLFluff lint rules (mirrors txt: rules 01-28) | 1 plugin |
| `github-runner/sonar-rules-setup.sh` | Regex definitions for 25 txt: rules (auto-created at startup) | 1 script |
| `github-runner/tests.sqltest` | Runtime validation (row counts, aggregates) — not rule tests | 1 file |

### Coverage gap — rules without dedicated test files anywhere:

| Category | Untested Rules |
|----------|---------------|
| txt: template | MultiFileIfOneStringExistsThenBothMustExistCheck, MultilineTextMatchCheck, SimpleRegexMatchCheck, StringDisallowedIfMatchInAnotherFileCheck, RequiredStringNotPresentRegexMatchCheck |
| SQLCC: SQL Server only | C001 (SLEEP), C005 (EXEC), C007 (NOLOCK), C010/C011/C013 (naming), C020 (HINT), C021 (COMMIT) — not applicable to Snowflake |

---

## Notes

- The README documents **82 rules** across 3 tools (40 txt + 19 SQLCC + 23 SQLFluff)
- SonarQube currently has **93 rules** installed (47 txt + 20 SQLCC + 26 SQLFluff)
- The difference: 7 additional txt rules (template rules + newer additions like Stream/Semantic View naming, ALTER TABLE DROP COLUMN, TRUNCATE, Task SERVERLESS), 1 extra SQLCC rule (C030), 3 extra SQLFluff rules (LT04, RF05, CV06)
- Rules 43-47 (txt) are template rule types from the Community Text Plugin — not custom DataOps rules
- Only **78 of 93 rules** triggered issues on this project's codebase (remaining 15 are SQL Server-specific or template rules)
- **37 of 42 custom txt rules** have dedicated positive/negative test coverage in this repo (88%)
- **13 of 20 SQLCC rules** tested (65%) — 7 are SQL Server-only (n/a for Snowflake)
- **26 of 26 SQLFluff rules** tested (100%)
- **76 of 93 total rules** have dedicated test coverage (82%)
- SQLCC and SQLFluff standard rules are also tested upstream (SQLFluff has its own test suite, SQLCC is AST-based)
- DataOpsBackbone provides integration tests via `good_example.sql` / `bad_example.sql` covering 15 of the 28 original rules
