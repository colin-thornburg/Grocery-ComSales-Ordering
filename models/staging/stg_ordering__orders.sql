SELECT
    order_id,
    customer_id,
    product_id,
    order_date,
    quantity,
    CAST(unit_price AS NUMERIC) as unit_price,
    delivery_id,
    CAST(quantity * unit_price AS NUMERIC) as total_amount
FROM {{ ref('raw_orders') }}