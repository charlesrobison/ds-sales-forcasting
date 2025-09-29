{{ config(materialized='view') }}

with source as (
    select distinct
        Customer_Type as customer_type,
        Payment_Method as preferred_payment_method,
        Sales_Channel as sales_channel
    from {{ ref('stg_sales') }}
)

select
    row_number() over (order by customer_type) as customer_id,
    *
from source
