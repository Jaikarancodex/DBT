{{ config(materialized='table') }}

select
    customer_id,

    total_orders,

    total_spent,

    avg_order_value,

    total_items,

    total_discount,

    -- segmentation logic 🔥
    case 
        when total_spent > 2000 then 'VIP'
        when total_spent between 1000 and 2000 then 'HIGH_VALUE'
        else 'NORMAL'
    end as customer_segment

from {{ ref('int_customer_orders') }}