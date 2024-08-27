WITH data AS (
    SELECT 
        * 
    FROM 
        {{ ref('int_sales_margin') }}  
)
SELECT 
    orders_id,
    date_date, 
    SUM(quantity) AS quantity, 
    SUM(revenue) AS revenue,
    SUM(purchase_cost) AS purchase_cost, 
    (SUM(revenue) - SUM(purchase_cost)) AS margin  
FROM 
    data
GROUP BY 
    orders_id, date_date
ORDER BY date_date DESC