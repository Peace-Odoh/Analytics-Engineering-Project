
with source_data as (

    select * from {{ source('excel', 'olist_product_category_name_translation_dataset') }}
 

)

select 
    product_category_name,
    product_category_name_english
from source_data

