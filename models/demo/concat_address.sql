{{ 
    config
    ( 
        materialized='table'
    )
}}

SELECT {{ concat_macro('123Street','Chicago') }} AS ADDRESS