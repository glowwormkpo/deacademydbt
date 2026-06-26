{{
    config
    (
        materialized = 'table'
    )
}}
WITH CLEAN_ORDERS AS
(
    SELECT
    ORDER_ID,
    ORDER_DATE,
    CUSTOMER_ID,
    CUSTOMER_NAME,
    CREATED_AT,
    CURRENT_TIMESTAMP AS INSERT_DTS
    FROM {{ ref('clean_orders') }}
)
SELECT * FROM CLEAN_ORDERS