-- models/marts/clients/dm_clients.sql
with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select * from {{ ref('stg_order_items') }}
),

customer_orders as (
    select
        c.customer_id,
        c.first_name,
        c.last_name,
        c.state,
        count(distinct o.order_id) as number_of_orders,
        sum(oi.quantity) as total_items_ordered,
        sum(oi.list_price * oi.discount) as total_paid
    from customers c
    left join orders o on c.customer_id = o.customer_id
    left join order_items oi on o.order_id = oi.order_id
    group by c.customer_id, c.first_name, c.last_name, c.state
)

select * from customer_orders
