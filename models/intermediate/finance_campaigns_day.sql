SELECT date_date, ROUND((Operational_margin - ads_cost),1) AS ads_margin , average_basket, Operational_margin, ads_cost, nb_transactions, 
FROM 
{{ref("int_campaigns_day")}} 
JOIN {{ref("finance_days")}} 
USING(date_date)
ORDER BY date_date DESC