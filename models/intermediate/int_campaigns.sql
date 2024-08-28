WITH adwords_data AS (
    SELECT 
        'Adwords' AS source,
        date_date,
        paid_source,
        campaign_key,
        campaing_name,
        ads_cost,
        impression,
        click
    FROM {{ ref("stg_raw__adwords") }}
),
bing_data AS (
    SELECT 
        'Bing' AS source,
        date_date,
        paid_source,
        campaign_key,
        campaing_name,
        ads_cost,
        impression,
        click
    FROM {{ ref("stg_raw__bing") }}
),
criteo_data AS (
    SELECT 
        'Criteo' AS source,
        date_date,
        paid_source,
        campaign_key,
        campaing_name,
        ads_cost,
        impression,
        click
    FROM {{ ref("stg_raw__criteo") }}
),
facebook_data AS (
    SELECT 
        'Facebook' AS source,
        date_date,
        paid_source,
        campaign_key,
        campaing_name,
        ads_cost,
        impression,
        click
    FROM {{ ref("stg_raw__facebook") }}
)

SELECT * FROM adwords_data
UNION ALL
SELECT * FROM bing_data
UNION ALL
SELECT * FROM criteo_data
UNION ALL
SELECT * FROM facebook_data





