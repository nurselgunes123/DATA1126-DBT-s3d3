SELECT
    s.date_date,
    s.order_id,
    s.product_id,
    s.revenue,
    s.quantity,
    p.purchSE_PRICE AS purchase_price,
    CAST(s.quantity AS FLOAT64) * CAST(p.purchSE_PRICE AS FLOAT64) AS satin_alma_maliyeti,
    CAST(s.revenue AS FLOAT64) - (CAST(s.quantity AS FLOAT64) * CAST(p.purchSE_PRICE AS FLOAT64)) AS marj
FROM {{ ref('stg_greenweez__sales') }} AS s
LEFT JOIN {{ ref('stg_raw_product') }} AS p
    ON s.product_id = p.products_id