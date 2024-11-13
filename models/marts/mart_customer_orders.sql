SELECT
    o.customer_id,
    COUNT(DISTINCT o.order_id) as total_orders,
    SUM(o.total_amount) as total_spend,
    AVG(o.quantity) as avg_order_quantity,
    SUM(d.total_fuel_cost) as total_delivery_cost,
    CAST(SUM(o.total_amount) - SUM(d.total_fuel_cost) AS NUMERIC) as customer_contribution
FROM {{ ref('stg_ordering__orders') }} o
LEFT JOIN {{ ref('Supply_Chain_Transportation', 'int_delivery_metrics') }} d
    ON o.delivery_id = d.delivery_id
GROUP BY o.customer_id