
WITH sales_data AS (
    SELECT 
        date_date,
        orders_id,
        CAST(revenue AS FLOAT64) AS revenue,
        pdt_id,  
        quantity, 
    FROM 
        {{ ref('stg_raw__sales') }}  
),
product_data AS (
    SELECT 
        products_id,
        CAST(purchase_price AS FLOAT64) AS purchase_cost

    FROM 
        {{ ref('stg_raw__product') }}  
)

SELECT 
    s.date_date,
    s.orders_id,
    revenue,
    s.pdt_id,  
    s.quantity,
    purchase_cost,  
    (revenue - (s.quantity * purchase_cost)) AS margin,
    
FROM 
    sales_data AS s
JOIN 
    product_data AS p
ON 
    s.pdt_id = p.products_id  
