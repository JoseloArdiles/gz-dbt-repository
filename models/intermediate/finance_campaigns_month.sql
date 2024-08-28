SELECT 
  FORMAT_TIMESTAMP('%Y-%m-01', date_date) AS datemonth, 
  SUM(ads_margin) AS ads_margin, 
  SUM(average_basket) AS average_basket, 
  SUM(Operational_margin) AS Operational_margin, 
  SUM(ads_cost) AS ads_cost, 
  SUM(nb_transactions) AS nb_transactions
FROM 
  {{ref("finance_campaigns_day")}}
GROUP BY 
  datemonth
ORDER BY 
  datemonth DESC
