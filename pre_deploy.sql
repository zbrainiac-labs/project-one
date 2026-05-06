CREATE DATABASE IF NOT EXISTS {{ db }}
    COMMENT = 'Development database for project-one';

CREATE SCHEMA IF NOT EXISTS {{ db }}.{{ schema }}
    COMMENT = 'Raw data landing zone for project-one';

CREATE DCM PROJECT IF NOT EXISTS {{ db }}.{{ schema }}.PROJECT_ONE;
