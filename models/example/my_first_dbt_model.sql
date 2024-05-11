
{{ config(materialized='table') }}

with source_data as (

select * from hip-rain-422310-q6.test.createstat
)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
