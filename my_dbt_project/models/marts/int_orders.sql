with
orders as (select * from {{ ref('stg_orders') }}),
items  as (select * from {{ ref('stg_order_items') }}),
pay    as (select * from {{ ref('stg_payments') }})

select
  o.order_id,
  o.customer_id,
  o.order_status,
  o.order_purchase_ts,
  sum(i.price + i.freight_value) as gross_merch_value,
  sum(pay.payment_value)         as total_paid
from orders o
left join items i using (order_id)
left join pay   using (order_id)
group by 1,2,3,4
