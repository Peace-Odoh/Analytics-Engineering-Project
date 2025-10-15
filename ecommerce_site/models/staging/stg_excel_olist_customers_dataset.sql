with source_data as (

    select * from {{ source('excel', 'olist_customers_dataset') }}
 

)

select 
    customer_id,    
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
from source_data

