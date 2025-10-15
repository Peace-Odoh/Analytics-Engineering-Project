

with source_data as (

    select * from {{ source('excel', 'olist_orders_dataset') }}
 

)

select 
    order_id,
    customer_id,    
    order_status,
    order_purchase_timestamp as order_created_at,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
from source_data
