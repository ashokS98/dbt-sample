
-- Use the `ref` function to select from other models

{{
    config(
        materialized = 'incremental'
    )
}}



select *
from {{ ref('my_first_dbt_model') }}
where
{% if is_incremental() %} 
rank > (select max(rank) from {{this}})
{% endif %}
