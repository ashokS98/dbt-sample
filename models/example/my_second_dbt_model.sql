
-- Use the `ref` function to select from other models

{{
    config(
        materialized = 'incremental'
    )
}}

{% if is_incremental() %} 
  and rank > (select max(rank) from {{this}})
{% endif %}

select *
from {{ ref('my_first_dbt_model') }}

