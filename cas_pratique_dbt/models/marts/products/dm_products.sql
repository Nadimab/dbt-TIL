-- models/marts/products/dm_products.sql
with products as (
    select * from {{ ref('stg_products') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

product_sales as (
    select
        p.product_id,
        p.product_name,
        p.list_price,
        sum(oi.quantity) as total_quantity_sold,
        sum(oi.quantity) * p.list_price as total_sales
    from products p
    left join order_items oi on p.product_id = oi.product_id
    group by p.product_id, p.product_name, p.list_price
)

select * from product_sales
