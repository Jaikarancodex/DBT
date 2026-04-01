{{ config(materialized='table') }}

select
    order_date,

    total_orders,

    total_revenue,

    total_items_sold,

    -- derived KPI
    total_revenue / total_orders as avg_order_value

from {{ ref('int_daily_sales') }}