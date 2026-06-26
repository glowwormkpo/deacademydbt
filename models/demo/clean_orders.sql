{{
    config
    (
        materialized = 'ephemeral'
    )
}}


WITH BASE_ORDERS AS
(
    SELECT
    ORDER_ID,
    ORDER_DATE,
    CUSTOMER_ID,
    CREATED_AT,
    CASE WHEN CUSTOMER_NAME IS NULL THEN 'NA' ELSE upper(CUSTOMER_NAME) END AS CUSTOMER_NAME
    FROM {{ source('orders','BASE_ORDERS') }}
    WHERE ORDER_DATE IS NOT NULL
)
SELECT * FROM BASE_ORDERS