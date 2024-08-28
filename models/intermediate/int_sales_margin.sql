
WITH sales_data AS (
    SELECT 
        * 
    FROM 
        {{ ref('stg_raw__sales') }}  
),
product_data AS (
    SELECT 
        * 
    FROM 
        {{ ref('stg_raw__product') }}  
)

SELECT 
    s.date_date,
    s.orders_id,
    s.revenue,
    s.pdt_id,  
    s.quantity,
    CAST(p.purchase_price AS FLOAT64) AS purchase_price, 
    (s.quantity * CAST(p.purchase_price AS FLOAT64)) AS purchase_cost,  
    ((CAST(s.revenue AS FLOAT64)) - (s.quantity *( CAST(p.purchase_price AS FLOAT64)))) AS margin 
FROM 
    sales_data AS s
JOIN 
    product_data AS p
ON 
    s.pdt_id = p.products_id  
