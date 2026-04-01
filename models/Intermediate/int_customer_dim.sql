{{ config(materialized='table') }}

select
    customer_id,
    max(city) as city,
    max(country) as country
from {{ ref('stg_orders') }}
group by customer_id