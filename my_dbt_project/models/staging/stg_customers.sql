with src as (
  select * from {{ source('olist', 'olist_customers') }}
)

select
  customer_id,
  customer_unique_id,
  customer_city,
  customer_state
from src
