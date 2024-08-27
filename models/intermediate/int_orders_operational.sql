-- models/intermediate/int_orders_operational.sql

WITH sales_margin_data AS (
    SELECT 
        * 
    FROM 
        {{ ref('int_orders_margin') }}  
),
ship_data AS (
    SELECT 
        orders_id,
        (CAST(shipping_fee AS FLOAT64)) AS shipping_fee,
        (CAST(logcost AS FLOAT64)) AS logcost,
        (CAST(ship_cost AS FLOAT64)) AS ship_cost 
    FROM 
        {{ ref('stg_raw__ship') }} 
)

SELECT 
    date_date,
    s.orders_id,
    (SUM(s.margin) + 
    SUM(sh.shipping_fee ) - 
    SUM(sh.logcost ) - 
    SUM(sh.ship_cost )) AS Operational_margin,
    SUM(quantity) AS quantity,
    SUM(revenue) AS revenue,
    SUM(margin) AS margin

FROM 
    sales_margin_data AS s
JOIN 
    ship_data AS sh
ON 
    s.orders_id = sh.orders_id 

GROUP BY 
    s.orders_id, date_date 

ORDER BY date_date DESC

