DEFINE TABLE {{db}}.{{schema}}.ONEO_RAW_TB_WH_SIZE_RECOMMENDATION (
    BYTES_SCANNED_LOWER NUMBER(38,0),
    BYTES_SCANNED_UPPER NUMBER(38,0),
    RECOMMENDED_SIZE VARCHAR(20)
)
COMMENT = 'Warehouse sizing recommendations based on bytes scanned thresholds';
