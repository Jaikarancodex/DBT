{{ config(materialized='table') }}

select
    order_date,

    count(*) as total_orders,

    sum(amount) as total_revenue,

    sum(quantity) as total_items_sold

from {{ ref('stg_orders') }}
where order_status = 'delivered'
group by order_date