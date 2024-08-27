WITH differences AS (
    SELECT
        *
    FROM {{ source('raw', 'ship') }} 
    WHERE
        shipping_fee <> shipping_fee_1
        OR (shipping_fee IS NULL AND shipping_fee_1 IS NOT NULL)
        OR (shipping_fee IS NOT NULL AND shipping_fee_1 IS NULL)
)

SELECT
    COUNT(*) AS errors
FROM
    differences
