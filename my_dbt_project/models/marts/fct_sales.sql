select
  order_id,
  customer_id,
  order_status,
  order_purchase_ts,
  gross_merch_value,
  total_paid
from {{ ref('int_orders') }}
