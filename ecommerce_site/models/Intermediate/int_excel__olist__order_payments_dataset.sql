select
  order_id,
  sum(payment_value) as total_payment,
  count(*) as payment_count,
  max(payment_installments) as max_installments,
  min(payment_type) as primary_payment_type
from {{ ref('stg_excel__olist_order_payments_dataset.sql') }}
group by order_id
