SELECT
    *,
    CAST(purchase_price AS FLOAT64) AS purchase_price
FROM {{ source('greenweez', 'product') }}