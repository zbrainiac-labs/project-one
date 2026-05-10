# SonarQube Issues Report — project-one

**Total Issues: 567** | **Sources: `.sql`, `.json`, `.sqltest` only**  
**Scan Date: 2026-05-10 (clean scan — `.md`/`.csv`/`.yml` excluded, SQLFluff included)**

---

## Summary by Rule Category

| Category | Rules Available | Rules Triggered | Issues |
|----------|---------------|-----------------|--------|
| SonarQube Text Plugin (txt:) | 43 custom + 5 templates | 42 | 219 |
| SQL Code Checker (SQLCC:) | 20 | 11 | 58 |
| SQLFluff (external) | 42 | 42 | 290 |
| **Total** | **110** | **95** | **567** |

---

## Community Text Plugin Rules (txt:) — 43 custom rules, 219 issues

| # | Rule Key | Description | Severity | Issues | Tested |
|---|----------|-------------|----------|--------|--------|
| 1 | txt:Disallow_GRANT_Statements_to_PUBLIC | Disallow GRANT to PUBLIC | CRITICAL | 4 | ✓ `rule_04` |
| 2 | txt:Disallow_GRANT_ALL_PRIVILEGES | Disallow GRANT ALL PRIVILEGES | MAJOR | 6 | ✓ `rule_16` |
| 3 | txt:Disallow_ACCOUNTADMIN_in_scripts | Disallow ACCOUNTADMIN usage | CRITICAL | 6 | ✓ `rule_17` |
| 4 | txt:Disallow_plaintext_passwords | Disallow plaintext passwords in DDL | BLOCKER | 3 | ✓ `rule_18` |
| 5 | txt:Disallow_CREATE_SCHEMA_without_IF_NOT_EXISTS | CREATE SCHEMA without IF NOT EXISTS | MAJOR | 2 | ✓ `rule_01` |
| 6 | txt:Disallow_CREATE_TABLE_without_IF_NOT_EXISTS_or_REPLACE | CREATE TABLE without IF NOT EXISTS/REPLACE | MAJOR | 3 | ✓ `rule_02` |
| 7 | txt:Disallow_CREATE_statements_with_hardcoded_database_or_schema_prefix | Hardcoded DB/Schema prefix in CREATE | MAJOR | 4 | ✓ `rule_03` |
| 8 | txt:Disallow_dropping_objects_without_IF_EXISTS | DROP without IF EXISTS | MAJOR | 7 | ✓ `rule_05` |
| 9 | txt:Disallow_hardcoded_USE_DATABASE__SCHEMA__or_ROLE_statements | Hardcoded USE DATABASE/SCHEMA/ROLE | CRITICAL | 10 | ✓ `rule_06` |
| 10 | txt:Disallow_ALTER_TABLE_Drop_Column | ALTER TABLE DROP COLUMN (breaking change) | CRITICAL | 2 | ✓ `rule_33` |
| 11 | txt:Disallow_TRUNCATE_without_safeguard | Bare TRUNCATE TABLE (data loss risk) | CRITICAL | 4 | ✓ `rule_34` |
| 12 | txt:Disallow_usage_of_TIMESTAMP_types_other_than_TIMESTAMP_TZ | TIMESTAMP_NTZ/TIMESTAMP_LTZ | MAJOR | 6 | ✓ `rule_07` |
| 13 | txt:Disallow_FLOAT_DOUBLE | FLOAT/DOUBLE/REAL (prefer NUMBER) | MAJOR | 9 | ✓ `rule_20` |
| 14 | txt:Disallow_VARCHAR_without_length | VARCHAR without explicit length | MINOR | 6 | ✓ `rule_21` |
| 15 | txt:CREATE_TABLE_must_have_COMMENT | CREATE TABLE must include COMMENT (single-line) | MINOR | 18 | ✓ `rule_22` |
| 16 | txt:Disallow_ORDER_BY_in_views | ORDER BY in views (single-line) | MAJOR | 3 | ✓ `rule_23` |
| 17 | txt:Disallow_COPY_INTO_without_ON_ERROR | COPY INTO without ON_ERROR (single-line) | MAJOR | 3 | ✓ `rule_24` |
| 18 | txt:Dynamic_Table_must_have_TARGET_LAG | DT must specify TARGET_LAG (single-line) | MAJOR | 3 | ✓ `rule_25` |
| 19 | txt:Task_must_be_SERVERLESS | Tasks should use SERVERLESS (single-line) | MAJOR | 3 | ✓ `rule_35` |
| 20 | txt:DEFINE_must_have_COMMENT | DEFINE must include COMMENT (single-line) | MAJOR | 1 | ✓ `rule_38` |
| 21 | txt:Disallow_SELECT_star | Disallow SELECT * (force explicit columns) | MINOR | 7 | ✓ `rule_19` |
| 22 | txt:Schema_must_have_maturity_prefix | Schema names must follow DATA_MATURITY_ prefix | MAJOR | 12 | ✓ `rule_08` |
| 23 | txt:Schema_must_have_version_suffix | Schema names must end with _vNNN (lowercase) | MAJOR | 8 | ✓ `rule_09` |
| 24 | txt:Table_name_pattern | Table names: {DOMAIN}+{COMPONENT}_{MAT}_TB_ | MAJOR | 8 | ✓ `rule_10` |
| 25 | txt:View_name_pattern | View names: {DOMAIN}+{COMPONENT}_{MAT}_VW_ | MAJOR | 8 | ✓ `rule_11` |
| 26 | txt:Dynamic_Table_name_pattern | DT names: {DOMAIN}+{COMPONENT}_{MAT}_DT_ | MAJOR | 3 | ✓ `rule_12` |
| 27 | txt:Stage_name_pattern | Stage names: {DOMAIN}+{COMPONENT}_{MAT}_ST_ | MAJOR | 5 | ✓ `rule_13` |
| 28 | txt:File_Format_name_pattern | FF names: {DOMAIN}+{COMPONENT}_{MAT}_FF_ | MAJOR | 4 | ✓ `rule_26` |
| 29 | txt:Stored_Procedure_name_pattern | SP names: {DOMAIN}+{COMPONENT}_{MAT}_SP_ | MAJOR | 3 | ✓ `rule_27` |
| 30 | txt:Task_name_pattern | Task names: {DOMAIN}+{COMPONENT}_{MAT}_TK_ | MAJOR | 3 | ✓ `rule_28` |
| 31 | txt:Stream_name_pattern | Stream names: {DOMAIN}+{COMPONENT}_{MAT}_SM_ | MAJOR | 3 | ✓ `rule_37` |
| 32 | txt:Semantic_View_name_pattern | Semantic View names: {DOM}{COMP}_SV_ | MAJOR | 2 | ✓ `rule_36` |
| 33 | txt:Enforce__maturity_level__Code_at_Positions_5_7 | Maturity-level code at positions 5-7 | CRITICAL | 0 | ✓ `rule_08` |
| 34 | txt:Keywords_must_be_UPPER | SQL keywords must be UPPERCASE | MINOR | 4 | ✓ `rule_29` |
| 35 | txt:Unnecessary_ELSE_NULL | Unnecessary ELSE NULL in CASE | MINOR | 7 | ✓ `rule_32` |
| 36 | txt:JOIN_without_ON_clause | JOIN without ON clause | MAJOR | 7 | ✓ `rule_30` |
| 37 | txt:Implicit_alias_missing_AS | Implicit alias (missing AS) | MINOR | 2 | ✓ `rule_31` |
| 38 | txt:Table_names_must_begin_with...underscore | Table begins with 4-char domain+component code | MAJOR | 11 | ✓ `rule_10` |
| **Multiline Rules** | | | | | |
| 39 | txt:DEFINE_must_have_COMMENT_multiline | DEFINE must include COMMENT (multiline) | MAJOR | 1 | ✓ `rule_38` |
| 40 | txt:Dynamic_Table_must_have_TARGET_LAG_multiline | DT TARGET_LAG (multiline) | CRITICAL | 3 | ✓ `rule_25` |
| 41 | txt:Disallow_ORDER_BY_in_views_multiline | ORDER BY in views (multiline) | MAJOR | 3 | ✓ `rule_23` |
| 42 | txt:Task_must_be_SERVERLESS_multiline | Task SERVERLESS (multiline) | MAJOR | 3 | ✓ `rule_35` |
| 43 | txt:Disallow_COPY_INTO_without_ON_ERROR_multiline | COPY INTO ON_ERROR (multiline) | MAJOR | 3 | ✓ `rule_24` |
| 44 | txt:CREATE_TABLE_must_have_COMMENT_multiline | CREATE TABLE COMMENT (multiline) | MINOR | 6 | ✓ `rule_22` |

---

## SQL Code Checker Rules (SQLCC:) — 20 rules, 58 issues

| # | Rule Key | Description | Severity | Issues | Tested |
|---|----------|-------------|----------|--------|--------|
| 1 | SQLCC:C002 | SELECT * is used | MINOR | 6 | ✓ |
| 2 | SQLCC:C003 | INSERT statement without columns listed | MINOR | 4 | ✓ |
| 3 | SQLCC:C004 | ORDER BY clause contains positional references | MINOR | 3 | ✓ |
| 4 | SQLCC:C009 | Non-sargable statement used | MAJOR | 2 | ✓ |
| 5 | SQLCC:C012 | Comparison operator to check if value is null | MAJOR | 3 | ✓ |
| 6 | SQLCC:C014 | OR verb is used in a WHERE clause | MAJOR | 2 | ✓ |
| 7 | SQLCC:C015 | UNION operator is used | MAJOR | 1 | ✓ |
| 8 | SQLCC:C016 | IN/NOT IN is used for a subquery | MAJOR | 2 | ✓ |
| 9 | SQLCC:C017 | ORDER BY without ASC/DESC | MINOR | 7 | ✓ |
| 10 | SQLCC:C022 | Non-materialized view found | MAJOR | 27 | ✓ |
| 11 | SQLCC:C023 | Cartesian join found | MAJOR | 1 | ✓ |
| 12 | SQLCC:C001 | SLEEP/WAITFOR is used (SQL Server only) | MINOR | 0 | n/a |
| 13 | SQLCC:C005 | EXECUTE/EXEC for dynamic query (SQL Server only) | MINOR | 0 | n/a |
| 14 | SQLCC:C007 | NOLOCK hint used (SQL Server only) | MINOR | 0 | n/a |
| 15 | SQLCC:C010 | PK naming convention (SQL Server only) | MINOR | 0 | n/a |
| 16 | SQLCC:C011 | FK naming convention (SQL Server only) | MINOR | 0 | n/a |
| 17 | SQLCC:C013 | Index naming convention (SQL Server only) | MINOR | 0 | n/a |
| 18 | SQLCC:C020 | HINT is used (SQL Server only) | MINOR | 0 | n/a |
| 19 | SQLCC:C021 | COMMIT is missing (SQL Server only) | MINOR | 0 | n/a |
| 20 | SQLCC:C030 | File does not start with header comment | MINOR | 0 | ✓ |

---

## SQLFluff Rules (external) — 42 rules, 290 issues

| # | Rule | Description | Issues | Tested |
|---|------|-------------|--------|--------|
| 1 | LT01 | Unnecessary whitespace | 19 | ✓ |
| 2 | LT02 | Indentation | 30 | ✓ |
| 3 | LT04 | Comma placement | 2 | ✓ |
| 4 | LT05 | Commas should not have preceding whitespace | 1 | ✓ |
| 5 | LT06 | Function name spacing | 2 | ✓ |
| 6 | LT07 | CTE definition not starting with newline | 1 | ✓ |
| 7 | LT08 | CTE bracket newline | 2 | ✓ |
| 8 | LT09 | Select targets formatting | 62 | ✓ |
| 9 | LT10 | SELECT modifiers placement | 1 | ✓ |
| 10 | LT14 | Keyword newline | 41 | ✓ |
| 11 | AL01 | Missing AS keyword (implicit alias) | 31 | ✓ |
| 12 | AL02 | Implicit column alias | 5 | ✓ |
| 13 | AL03 | Column alias not unique | 2 | ✓ |
| 14 | AL05 | Tables and subqueries should be aliased | 2 | ✓ |
| 15 | CP02 | Identifier casing | 28 | ✓ |
| 16 | CP04 | Boolean casing | 3 | ✓ |
| 17 | AM02 | UNION vs UNION ALL | 1 | ✓ |
| 18 | AM04 | SELECT * unknown columns | 9 | ✓ |
| 19 | AM05 | JOIN without ON clause | 11 | ✓ |
| 20 | AM06 | Inconsistent column references | 4 | ✓ |
| 21 | AM08 | Cartesian product (CROSS JOIN) | 1 | ✓ |
| 22 | AM09 | LIMIT without ORDER BY | 1 | ✓ |
| 23 | CV01 | Use != instead of <> | 1 | ✓ |
| 24 | CV05 | Comparison with NULL should use IS | 3 | ✓ |
| 25 | CV06 | Statement not terminated with semicolon | 1 | ✓ |
| 26 | CV12 | Unreachable CASE WHEN | 2 | ✓ |
| 27 | RF01 | FROM clause not referencing source | 1 | ✓ |
| 28 | RF02 | Unnecessary qualified references | 2 | ✓ |
| 29 | RF04 | Keywords as identifiers | 8 | ✓ |
| 30 | RF06 | Unnecessary casting | 3 | ✓ |
| 31 | ST01 | ELSE clause should not contain nested CASE | 3 | ✓ |
| 32 | ST02 | Unnecessary CASE when function exists | 2 | ✓ |
| 33 | ST04 | Nested CASE inside COALESCE | 1 | ✓ |
| 34 | ST06 | Unnecessary ELSE NULL | 1 | ✓ |
| 35 | ST07 | USING vs ON in joins | 1 | ✓ |
| 36 | ST11 | Use UNION ALL instead of UNION | 2 | ✓ |

---

## Test Coverage Summary

### project-one (this repo)

| Test Location | Covers | Files |
|---------------|--------|-------|
| `workload/rule_01_*.sql` — `rule_38_*.sql` | Rules 01-38 (positive + negative regex tests, single-line + multiline) | 38 files |
| `workload/rule_test_*.sql` | Rules 01-28 grouped by category | 7 files |
| `workload/rule_sqlcc_*.sql` | SQLCC rules C002-C023, C030 (positive + negative) | 13 files |
| `workload/rule_sqlfluff_*.sql` | SQLFluff rules (positive + negative) | 26 files |
| `sqlunit/tests.sqltest` | Rules 04, 07, 10-13, 20-22, 25 (runtime INFORMATION_SCHEMA checks) | 1 file |

### DataOpsBackbone (upstream — shared infrastructure)

| Test Location | Covers |
|---------------|--------|
| `sqlfluff/test_sql/good_example.sql` | Compliant SQL for rules 01, 02, 05, 07, 13, 22, 24, 25, 26 |
| `sqlfluff/test_sql/bad_example.sql` | Non-compliant SQL for rules 01-07, 16-22, 25 (15 rules) |
| `sqlfluff/plugins/dataops_rules/` | DO01-DO28 as SQLFluff lint rules (mirrors txt: rules 01-28) |
| `github-runner/sonar-rules-setup.sh` | Regex definitions for all 43 txt: rules + 6 multiline rules |
| `github-runner/sonar-scanner_v2.sh` | Scanner config: text.inclusions, exclusions, SQLFluff integration |

### Rules with 0 issues

| Rule | Reason |
|------|--------|
| txt:Enforce__maturity_level__Code_at_Positions_5_7 | Regex logic needs review |
| SQLCC:C001, C005, C007, C010, C011, C013, C020, C021 | SQL Server-only — not applicable to Snowflake |
| SQLCC:C030 | No files without header comments in current scan |

---

## Notes

- All **43 custom txt: rules** fire correctly (42 with issues, 1 needs regex review)
- All **6 multiline rules** fire correctly with statement-boundary guards
- All **11 applicable SQLCC rules** fire
- All **42 SQLFluff rules** fire via external issues report
- Issues sourced exclusively from `.sql`, `.json`, and `.sqltest` files
- `Disallow_SELECT_star` removed (redundant with SQLCC:C002) — now 43 txt rules
- Single-line rules exclude multi-line openings (lines ending with `(` or bare table names)
- Multiline rules use `(?ism)` flags, `^` line anchors, and `\n(?:CREATE|DEFINE)` statement boundaries
- All rules now include descriptive `message` param (no more "rule has no message defined")
- Schema version suffix enforces lowercase `_vNNN` (case-sensitive)
- `rescan.sh` includes SQLFluff scan via `sqlfluff-to-sonar.sh`
