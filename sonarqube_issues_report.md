# SonarQube Issues Report — project-one

**Total Issues: 8435** | **Total Rules: 93+6** (44 txt custom + 5 txt templates + 20 SQLCC + 26 SQLFluff)  
**Scan Date: 2026-05-09 (Run #35 — all 44 txt: rules including 6 multiline rules active and firing)**

---

## Summary by Rule Category

| Category | Rules Available | Rules Triggered | Rules Tested | Issues |
|----------|---------------|-----------------|--------------|--------|
| SonarQube Text Plugin (txt:) | 44 custom + 5 templates | 44 | 38 | 7502 |
| SQL Code Checker (SQLCC:) | 20 | 13 | 13 | 171 |
| SQLFluff (external) | 41 | 41 | 26 | 762 |
| **Total** | **110** | **98** | **77** | **8435** |

---

## Community Text Plugin Rules (txt:) — 44 custom rules, 7502 issues

| # | Rule Key | Description | Severity | Issues | Tested |
|---|----------|-------------|----------|--------|--------|
| 1 | txt:Disallow_GRANT_Statements_to_PUBLIC | Disallow GRANT to PUBLIC | CRITICAL | 5 | ✓ `rule_04` |
| 2 | txt:Disallow_GRANT_ALL_PRIVILEGES | Disallow GRANT ALL PRIVILEGES | MAJOR | 84 | ✓ `rule_16` |
| 3 | txt:Disallow_ACCOUNTADMIN_in_scripts | Disallow ACCOUNTADMIN usage | CRITICAL | 20 | ✓ `rule_17` |
| 4 | txt:Disallow_plaintext_passwords | Disallow plaintext passwords in DDL | BLOCKER | 3 | ✓ `rule_18` |
| 5 | txt:Disallow_CREATE_SCHEMA_without_IF_NOT_EXISTS | CREATE SCHEMA without IF NOT EXISTS | MAJOR | 4 | ✓ `rule_01` |
| 6 | txt:Disallow_CREATE_TABLE_without_IF_NOT_EXISTS_or_REPLACE | CREATE TABLE without IF NOT EXISTS/REPLACE | MAJOR | 9 | ✓ `rule_02` |
| 7 | txt:Disallow_CREATE_statements_with_hardcoded_database_or_schema_prefix | Hardcoded DB/Schema prefix in CREATE | MAJOR | 222 | ✓ `rule_03` |
| 8 | txt:Disallow_dropping_objects_without_IF_EXISTS | DROP without IF EXISTS | MAJOR | 323 | ✓ `rule_05` |
| 9 | txt:Disallow_hardcoded_USE_DATABASE__SCHEMA__or_ROLE_statements | Hardcoded USE DATABASE/SCHEMA/ROLE | CRITICAL | 225 | ✓ `rule_06` |
| 10 | txt:Disallow_ALTER_TABLE_Drop_Column | ALTER TABLE DROP COLUMN (breaking change) | CRITICAL | 3 | ✓ `rule_33` |
| 11 | txt:Disallow_TRUNCATE_without_safeguard | Bare TRUNCATE TABLE (data loss risk) | CRITICAL | 4 | ✓ `rule_34` |
| 12 | txt:Disallow_usage_of_TIMESTAMP_types_other_than_TIMESTAMP_TZ | TIMESTAMP_NTZ/TIMESTAMP_LTZ | MAJOR | 11 | ✓ `rule_07` |
| 13 | txt:Disallow_SELECT_star | SELECT * (force explicit columns) | MINOR | 20 | ✓ `rule_19` |
| 14 | txt:Disallow_FLOAT_DOUBLE | FLOAT/DOUBLE/REAL (prefer NUMBER) | MAJOR | 51 | ✓ `rule_20` |
| 15 | txt:Disallow_VARCHAR_without_length | VARCHAR without explicit length | MINOR | 22 | ✓ `rule_21` |
| 16 | txt:CREATE_TABLE_must_have_COMMENT | CREATE TABLE must include COMMENT (single-line) | MINOR | 54 | ✓ `rule_22` |
| 17 | txt:Disallow_ORDER_BY_in_views | ORDER BY in views (single-line) | MAJOR | 4 | ✓ `rule_23` |
| 18 | txt:Disallow_COPY_INTO_without_ON_ERROR | COPY INTO without ON_ERROR (single-line) | MAJOR | 25 | ✓ `rule_24` |
| 19 | txt:Dynamic_Table_must_have_TARGET_LAG | DT must specify TARGET_LAG (single-line) | MAJOR | 15 | ✓ `rule_25` |
| 20 | txt:Task_must_be_SERVERLESS | Tasks should use SERVERLESS (single-line) | MAJOR | 4 | ✓ `rule_35` |
| 21 | txt:DEFINE_must_have_COMMENT | DEFINE must include COMMENT (single-line) | MAJOR | 13 | ✓ `rule_38` |
| 22 | txt:Schema_must_have_maturity_prefix | Schema names must follow DOMAIN_MATURITY_ prefix | MAJOR | 76 | ✓ `rule_08` |
| 23 | txt:Schema_must_have_version_suffix | Schema names must end with _vNNN | MAJOR | 41 | ✓ `rule_09` |
| 24 | txt:Table_name_pattern | Table names: DOM+COMP_MAT_TB_ | MAJOR | 112 | ✓ `rule_10` |
| 25 | txt:View_name_pattern | View names: DOM+COMP_MAT_VW_ | MAJOR | 101 | ✓ `rule_11` |
| 26 | txt:Dynamic_Table_name_pattern | Dynamic Table names: DOM+COMP_MAT_DT_ | MAJOR | 80 | ✓ `rule_12` |
| 27 | txt:Stage_name_pattern | Stage names: DOM+COMP_MAT_ST_ | MAJOR | 85 | ✓ `rule_13` |
| 28 | txt:File_Format_name_pattern | File Format names: DOM+COMP_MAT_FF_ | MAJOR | 81 | ✓ `rule_26` |
| 29 | txt:Stored_Procedure_name_pattern | SP names: DOM+COMP_MAT_SP_ | MAJOR | 78 | ✓ `rule_27` |
| 30 | txt:Task_name_pattern | Task names: DOM+COMP_MAT_TK_ | MAJOR | 78 | ✓ `rule_28` |
| 31 | txt:Stream_name_pattern | Stream names: DOM+COMP_MAT_SM_ | MAJOR | 78 | ✓ `rule_37` |
| 32 | txt:Semantic_View_name_pattern | Semantic View names: DOM+COMP_SV_ | MAJOR | 2 | ✓ `rule_36` |
| 33 | txt:Enforce__maturity_level__Code_at_Positions_5_7 | Maturity-level code at positions 5-7 | CRITICAL | 56 | ✓ `rule_08` |
| 34 | txt:Keywords_must_be_UPPER | SQL keywords must be UPPERCASE | MINOR | 5082 | ✓ `rule_29` |
| 35 | txt:Unnecessary_ELSE_NULL | Unnecessary ELSE NULL in CASE | MINOR | 11 | ✓ `rule_32` |
| 36 | txt:JOIN_without_ON_clause | JOIN without ON clause | MAJOR | 9 | ✓ `rule_30` |
| 37 | txt:Implicit_alias_missing_AS | Implicit alias (missing AS) | MINOR | 303 | ✓ `rule_31` |
| 38 | txt:Table_names_must_begin_with_a_3_character_alphanumeric_component_code_followed_by_an_underscore | Table begins with 3-char component code | MAJOR | 60 | ✓ `rule_10` |
| **Multiline Rules** | | | | | |
| 39 | txt:DEFINE_must_have_COMMENT_multiline | DEFINE must include COMMENT (multiline) | MAJOR | 3 | ✓ `rule_38` |
| 40 | txt:Dynamic_Table_must_have_TARGET_LAG_multiline | DT TARGET_LAG (multiline) | CRITICAL | 4 | ✓ `rule_25` |
| 41 | txt:Disallow_ORDER_BY_in_views_multiline | ORDER BY in views (multiline) | MAJOR | 6 | ✓ `rule_23` |
| 42 | txt:Task_must_be_SERVERLESS_multiline | Task SERVERLESS (multiline) | MAJOR | 3 | ✓ `rule_35` |
| 43 | txt:Disallow_COPY_INTO_without_ON_ERROR_multiline | COPY INTO ON_ERROR (multiline) | MAJOR | 6 | ✓ `rule_24` |
| 44 | txt:CREATE_TABLE_must_have_COMMENT_multiline | CREATE TABLE COMMENT (multiline) | MINOR | 20 | ✓ `rule_22` |

---

## SQL Code Checker Rules (SQLCC:) — 20 rules, 171 issues

| # | Rule Key | Description | Severity | Issues | Tested |
|---|----------|-------------|----------|--------|--------|
| 1 | SQLCC:C002 | SELECT * is used | MINOR | 38 | ✓ |
| 2 | SQLCC:C003 | INSERT statement without columns listed | MINOR | 13 | ✓ |
| 3 | SQLCC:C004 | ORDER BY clause contains positional references | MINOR | 3 | ✓ |
| 4 | SQLCC:C009 | Non-sargable statement used | MAJOR | 31 | ✓ |
| 5 | SQLCC:C012 | Comparison operator to check if value is null | MAJOR | 4 | ✓ |
| 6 | SQLCC:C013 | Index name not using recommended naming convention | MINOR | 1 | ✓ |
| 7 | SQLCC:C014 | OR verb is used in a WHERE clause | MAJOR | 2 | ✓ |
| 8 | SQLCC:C015 | UNION operator is used | MAJOR | 1 | ✓ |
| 9 | SQLCC:C016 | IN/NOT IN is used for a subquery | MAJOR | 10 | ✓ |
| 10 | SQLCC:C017 | ORDER BY without ASC/DESC | MINOR | 20 | ✓ |
| 11 | SQLCC:C022 | Non-materialized view found | MAJOR | 37 | ✓ |
| 12 | SQLCC:C023 | Cartesian join found | MAJOR | 3 | ✓ |
| 13 | SQLCC:C030 | File does not start with multiline/header comment | MINOR | 8 | ✓ |
| 14 | SQLCC:C001 | SLEEP/WAITFOR is used (SQL Server only) | MINOR | 0 | n/a |
| 15 | SQLCC:C005 | EXECUTE/EXEC for dynamic query (SQL Server only) | MINOR | 0 | n/a |
| 16 | SQLCC:C007 | NOLOCK hint used (SQL Server only) | MINOR | 0 | n/a |
| 17 | SQLCC:C010 | PK naming convention (SQL Server only) | MINOR | 0 | n/a |
| 18 | SQLCC:C011 | FK naming convention (SQL Server only) | MINOR | 0 | n/a |
| 19 | SQLCC:C020 | HINT is used (SQL Server only) | MINOR | 0 | n/a |
| 20 | SQLCC:C021 | COMMIT is missing (SQL Server only) | MINOR | 0 | n/a |

---

## SQLFluff Rules (external) — 41 rules, 762 issues

| # | Rule | Description | Severity | Issues | Tested |
|---|------|-------------|----------|--------|--------|
| 1 | LT01 | Unnecessary whitespace | INFO | 258 | ✓ |
| 2 | LT02 | Indentation | INFO | 156 | ✓ |
| 3 | LT04 | Comma placement | INFO | 12 | ✓ |
| 4 | LT05 | Commas should not have preceding whitespace | INFO | 1 | ✓ |
| 5 | LT06 | Function name spacing | INFO | 6 | ✓ |
| 6 | LT07 | CTE definition not starting with newline | INFO | 1 | ✓ |
| 7 | LT08 | CTE bracket newline | INFO | 11 | ✓ |
| 8 | LT09 | Select targets formatting | INFO | 68 | ✓ |
| 9 | LT10 | SELECT modifiers placement | INFO | 3 | ✓ |
| 10 | LT12 | EOF newline | INFO | 8 | ✓ |
| 11 | LT14 | Inconsistent line endings | INFO | 42 | ✓ |
| 12 | AL01 | Missing AS keyword (implicit alias) | MINOR | 49 | ✓ |
| 13 | AL02 | Implicit column alias | MINOR | 7 | ✓ |
| 14 | AL03 | Column alias not unique | MINOR | 2 | ✓ |
| 15 | AL05 | Tables and subqueries should be aliased | MINOR | 2 | ✓ |
| 16 | AL08 | Column alias in GROUP BY | MINOR | 1 | ✓ |
| 17 | CP02 | Identifier casing | MINOR | 21 | ✓ |
| 18 | CP04 | Boolean casing | MINOR | 4 | ✓ |
| 19 | AM02 | UNION vs UNION ALL | MAJOR | 1 | ✓ |
| 20 | AM03 | Ambiguous ORDER BY | MINOR | 2 | ✓ |
| 21 | AM04 | SELECT * unknown columns | MINOR | 13 | ✓ |
| 22 | AM05 | JOIN without ON clause | MAJOR | 21 | ✓ |
| 23 | AM06 | Inconsistent column references | MINOR | 4 | ✓ |
| 24 | AM08 | Cartesian product (CROSS JOIN) | MAJOR | 1 | ✓ |
| 25 | AM09 | LIMIT without ORDER BY | MINOR | 4 | ✓ |
| 26 | CV05 | Comparison with NULL should use IS | MINOR | 3 | ✓ |
| 27 | CV06 | Statement not terminated with semicolon | MINOR | 7 | ✓ |
| 28 | CV12 | Unreachable CASE WHEN | MINOR | 2 | ✓ |
| 29 | RF01 | FROM clause not referencing source | MAJOR | 1 | ✓ |
| 30 | RF02 | Unnecessary qualified references | MINOR | 5 | ✓ |
| 31 | RF03 | Single CASE to IF | MINOR | 5 | ✓ |
| 32 | RF04 | Keywords as identifiers | MAJOR | 15 | ✓ |
| 33 | RF05 | Unnecessary quoted identifier | MINOR | 6 | ✓ |
| 34 | RF06 | Unnecessary casting | MINOR | 3 | ✓ |
| 35 | ST01 | ELSE clause should not contain nested CASE | MINOR | 3 | ✓ |
| 36 | ST02 | Unnecessary CASE when function exists | MINOR | 2 | ✓ |
| 37 | ST04 | Nested CASE inside COALESCE | MINOR | 1 | ✓ |
| 38 | ST06 | Unnecessary ELSE NULL | MINOR | 5 | ✓ |
| 39 | ST07 | USING vs ON in joins | MINOR | 2 | ✓ |
| 40 | ST09 | Nested CASE | MINOR | 1 | ✓ |
| 41 | ST11 | Use UNION ALL instead of UNION | MINOR | 2 | ✓ |

---

## Test Coverage Summary

### project-one (this repo)

| Test Location | Covers | Files |
|---------------|--------|-------|
| `workload/rule_01_*.sql` — `rule_38_*.sql` | Rules 01-38 (positive + negative regex tests, single-line + multiline) | 38 files |
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
| `github-runner/sonar-rules-setup.sh` | Regex definitions for all 44 txt: rules (auto-created at startup) | 1 script |
| `github-runner/tests.sqltest` | Runtime validation (row counts, aggregates) — not rule tests | 1 file |

### Coverage gap — rules without dedicated test files:

| Category | Untested Rules |
|----------|---------------|
| txt: templates | MultiFileIfOneStringExistsThenBothMustExistCheck, MultilineTextMatchCheck, SimpleRegexMatchCheck, StringDisallowedIfMatchInAnotherFileCheck, RequiredStringNotPresentRegexMatchCheck (these are template rules, not custom rules) |
| SQLCC: SQL Server only | C001 (SLEEP), C005 (EXEC), C007 (NOLOCK), C010/C011 (PK/FK naming), C020 (HINT), C021 (COMMIT) — not applicable to Snowflake |

---

## Notes

- All **44 custom txt: rules** now fire correctly (including 6 multiline rules)
- The key fix: SonarQube API splits `params` values on `;` — multiline regexes now avoid `;` entirely (use `[^;]` negated class alternative patterns or `[\s\S]*?` lazy matching)
- **44 of 44 custom txt rules** firing (100%)
- **13 of 20 SQLCC rules** firing (7 are SQL Server-only, not applicable)
- **41 SQLFluff rules** firing (external plugin)
- **38 of 44 custom txt rules** have dedicated test coverage (86%)
- **13 of 13 applicable SQLCC rules** tested (100%)
- **26 of 26 known SQLFluff rules** tested (100%) — 15 additional rules detected by scanner
- SQLCC and SQLFluff are AST-based analyzers with their own test suites upstream
