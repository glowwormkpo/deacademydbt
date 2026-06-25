{{
    config
    (
        materialized = 'table'
    )
}}

WITH EMPLOYEE AS
(
    SELECT
    EMPID AS EMP_ID,
    SALARY AS EMP_SALARY,
    HIREDATE AS EMP_HIREDATE,
    split_part(NAME, ' ', 1) AS EMP_FIRSTNAME,
    split_part(NAME, ' ', 2) AS EMP_LASTNAME,
    split_part(ADDRESS, ',', 1) AS EMP_STREET,
    split_part(ADDRESS, ',', 2) AS EMP_CITY,
    split_part(ADDRESS, ',', 3) AS EMP_COUNTRY,
    split_part(ADDRESS, ',', 4) AS EMP_ZIPCODE
    FROM {{ source('EMPLOYEE', 'EMPLOYEE_RAW') }}
)
SELECT
    EMP_ID,
    EMP_FIRSTNAME,
    EMP_LASTNAME,
    EMP_SALARY,
    EMP_HIREDATE,
    EMP_STREET,
    EMP_CITY,
    EMP_COUNTRY,
    EMP_ZIPCODE
FROM EMPLOYEE
