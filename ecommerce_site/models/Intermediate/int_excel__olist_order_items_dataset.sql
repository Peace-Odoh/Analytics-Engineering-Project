select
  order_id,
  order_item_id,
  product_id,
  seller_id,
  price,
  freight_value,
  price + freight_value as gross_revenue
from {{ ref('stg_excel__olist_order_items_dataset.sql') }}
