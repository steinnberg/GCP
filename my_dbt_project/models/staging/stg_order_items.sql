with src as (
  select * from {{ source('olist', 'olist_order_items') }}
)

select
  order_id,
  order_item_id,
  product_id,
  seller_id,
  cast(price as numeric)          as price,
  cast(freight_value as numeric)  as freight_value,
  cast(shipping_limit_date as timestamp) as shipping_limit_ts
from src
