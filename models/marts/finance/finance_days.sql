
WITH operational_data AS (
    SELECT 
        date_date, 
        COUNT(DISTINCT orders_id) AS nb_transactions,
        SUM(revenue) AS turnover, 
        SUM(Operational_margin) AS operational_margin,  
        SUM(margin) AS margin  
    FROM 
        {{ ref('int_orders_operational') }} 
    GROUP BY 
        date_date  
)

SELECT 
    date_date,
    nb_transactions,  
    Round(SAFE_DIVIDE(turnover, nb_transactions),2) AS average_basket, 
    ROUND(turnover,2) AS turnover,  
    ROUND(operational_margin) AS Operational_margin,  
    ROUND(margin, 2) AS margin  
FROM 
    operational_data
ORDER BY date_date DESC