{{ config(materialized='table') }}

select
    sum(total_revenue) as total_revenue,
    sum(total_orders) as total_orders,
    avg(avg_order_value) as avg_order_value
from {{ ref('sales_summary') }}