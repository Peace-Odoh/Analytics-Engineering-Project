
SELECT
    order_id,
    customer_id,
    order_status,
    order_created_date,
    order_approved_date,
    order_delivered_customer_date,
    order_estimated_delivery_date,

    -- Flags
    CASE 
        WHEN order_status = 'delivered' THEN 1
        ELSE 0
    END AS is_delivered,

    CASE 
        WHEN order_status = 'delivered'
             AND order_delivered_customer_date <= order_estimated_delivery_date
        THEN 1
        ELSE 0
    END AS is_on_time_delivery,

    CASE
        WHEN order_status = 'cancelled' THEN 1
        ELSE 0
    END AS is_cancelled,

    -- Delivery Duration
    CASE 
        WHEN order_delivered_customer_date IS NOT NULL THEN
            DATEDIFF(day, order_created_date, order_delivered_customer_date)
        ELSE NULL
    END AS days_to_delivery,

    -- Estimated vs Actual Variance
    CASE
        WHEN order_delivered_customer_date IS NOT NULL THEN
            DATEDIFF(day, order_estimated_delivery_date, order_delivered_customer_date)
        ELSE NULL
    END AS delivery_variance_days

FROM {{ ref('stg_excel__olist_orders_dataset.sql') }};
