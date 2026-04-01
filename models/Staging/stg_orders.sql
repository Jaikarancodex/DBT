{{ config(materialized='view') }}

select
    cast(order_id as int) as order_id,
    cast(customer_id as int) as customer_id,
    cast(product_id as int) as product_id,

    lower(trim(product_name)) as product_name,
    lower(trim(category)) as category,

    cast(amount as double) as amount,
    cast(quantity as int) as quantity,
    cast(discount as double) as discount,

    lower(replace(payment_method, ' ', '_')) as payment_method,
    lower(order_status) as order_status,

    cast(order_date as date) as order_date,

    initcap(city) as city,
    initcap(country) as country

from {{ ref('orders') }}