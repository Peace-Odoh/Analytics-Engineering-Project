with source_data as (

    select * from {{ source('excel', 'olist_geolocation_dataset') }}
 

)

select 
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_statedbt run -m stg_excel_olist_customers_dataset

 from source_data

