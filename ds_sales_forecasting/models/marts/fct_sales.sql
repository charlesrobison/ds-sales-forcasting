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
    s.Sale_Date as sale_date,
    c.customer_id,
    p.product_key,
    p.product_id,
    s.Region as region,
    s.Sales_Rep as sales_rep,
    s.Sales_Amount as sales_amount,
    s.Quantity_Sold as quantity_sold,
    s.Discount as discount
from sales as s
left join customers as c
    on s.Customer_Type = c.customer_type
    and s.Payment_Method = c.preferred_payment_method
    and s.Sales_Channel = c.sales_channel
left join products as p
    on s.Product_ID = p.product_id
)

select * from final
