with source_data as (

    select * from {{ source('excel', 'olist_products_dataset') }}
 

)

select 
    product_id_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_lenght_cm,
    product_height_cm,
    product_width_cm
from source_data

