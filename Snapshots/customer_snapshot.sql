{% snapshot customer_snapshot %}

{{
    config(
        target_schema='dbt_test',
        unique_key='customer_id',
        strategy='check',
        check_cols=['city']
    )
}}

select
    customer_id,
    city,
    country
from {{ ref('int_customer_dim') }}

{% endsnapshot %}