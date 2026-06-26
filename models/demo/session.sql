{{
    config
    (
        materialized = 'table'
    )
}}
WITH SESSION_SRC AS
(
    SELECT
    a.SESSION_ID,
    a.USER_ID,
    a.BROWSER,
    a.DEVICE_TYPE,
    b.COUNTRY_NAME AS COUNTRY_NAME,
    b.CONTINENT AS CONTINENT,
    b.CURRENCY AS CURRENCY,
    a.START_TIME,
    a.END_TIME,
    a.PAGES_VISITED,
    CURRENT_TIMESTAMP as INSERT_DTS
    FROM {{ source('session','SESSION_SRC') }} a
    LEFT JOIN {{ ref('country_code') }} b
    ON a.COUNTRY_CODE = b.COUNTRY_CODE
)
SELECT * FROM SESSION_SRC