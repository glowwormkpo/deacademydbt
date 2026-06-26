{{
    config
    (
        materialized = 'view'
    )
}}

SELECT
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    PHONE,
    COUNTRY,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS
FROM {{ ref('customer') }}
WHERE COUNTRY = 'USA'