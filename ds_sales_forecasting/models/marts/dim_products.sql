{{ config(materialized='view') }}

with source as (
    select distinct
        Product_ID as product_id,
        Product_Category as product_category,
        Unit_Cost,
        Unit_Price
    from {{ ref('stg_sales') }}
)

select
    row_number() over (order by product_id) as product_key,
    *
from source
