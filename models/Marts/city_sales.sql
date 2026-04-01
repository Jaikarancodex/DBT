{{ config(materialized='table') }}

select
    city,
    sum(amount) as total_revenue,
    count(*) as total_orders
from {{ ref('stg_orders') }}
where order_status = 'delivered'
group by city