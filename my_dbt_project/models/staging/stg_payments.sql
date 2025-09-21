with src as (
  select * from {{ source('olist', 'olist_payments') }}
)

select
  order_id,
  payment_sequential,
  payment_type,
  cast(payment_installments as int64) as payment_installments,
  cast(payment_value as numeric)      as payment_value
from src
