
WITH operational_data AS (
    SELECT 
        date_date, 
        COUNT(DISTINCT orders_id) AS nb_transactions,  -- Número de transacciones (órdenes)
        SUM(revenue) AS total_turnover,  -- Suma de los ingresos para calcular el turnover total
        SUM(Operational_margin) AS total_operational_margin,  -- Margen operativo total
        SUM(margin) AS total_margin  -- Suma de los márgenes
    FROM 
        {{ ref('int_orders_operational') }} 
    GROUP BY 
        date_date  -- Agrupar por fecha
)

SELECT 
    date_date,
    nb_transactions,  -- Número de transacciones
    SAFE_DIVIDE(total_turnover, nb_transactions) AS average_basket,  -- Cálculo del average basket
    total_turnover,  -- Turnover total para cada fecha
    total_operational_margin,  -- Margen operativo total
    total_margin  -- Margen total
FROM 
    operational_data;
