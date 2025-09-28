with source as (
    select
        Product_ID as product_id,
        cast(Sale_Date as date) as sale_date,
        Sales_Rep as sales_rep,
        Region as region,
        cast(Sales_Amount as double) as sales_amount,
        cast(Quantity_Sold as int) as quantity_sold,
        Product_Category as product_category,
        Unit_Cost as unit_cost,
        Unit_Price as unit_price,
        Customer_Type as customer_type,
        Discount as discount,
        Payment_Method as payment_method,
        Sales_Channel as sales_channel,
        Region_and_Sales_Rep as region_sales_rep
    from {{ ref('sales_data') }}
)
select * from source
