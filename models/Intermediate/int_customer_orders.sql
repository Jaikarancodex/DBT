{{ config(materialized='table') }}

select
    customer_id,
    count(*) as total_orders,
    sum(amount) as total_spent,
    avg(amount) as avg_order_value,
    sum(quantity) as total_items,
    sum(discount) as total_discount
from {{ ref('stg_orders') }}
where order_status = 'delivered'
group by customer_id