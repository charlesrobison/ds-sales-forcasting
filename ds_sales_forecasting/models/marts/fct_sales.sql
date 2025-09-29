{{ config(materialized='table') }}

with sales as (
    select *
    from {{ ref('stg_sales') }}
),

customers as (
    select *
    from {{ ref('dim_customers') }}
),

products as (
    select *
    from {{ ref('dim_products') }}
),

final as (

select
    s.Sale_Date,
    c.customer_id,
    p.product_key,
    s.Region,
    s.Sales_Rep,
    s.Sales_Amount,
    s.Quantity_Sold,
    s.Discount
from sales as s
left join customers as c
    on s.Customer_Type = c.customer_type
    and s.Payment_Method = c.preferred_payment_method
    and s.Sales_Channel = c.sales_channel
left join products as p
    on s.Product_ID = p.product_id
)

select * from final
