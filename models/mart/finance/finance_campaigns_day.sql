{{ config(materialized='table') }}

SELECT
    date_date,
    ROUND(AVG(average_basket), 2) AS average_basket,
    ROUND(SUM(operational_margin), 2) AS operational_margin,
    SUM(quantity) AS quantity,
    ROUND(SUM(turnover), 2) AS turnover,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(shipping_fee), 2) AS shipping_fee,
    ROUND(SUM(log_cost), 2) AS log_cost
FROM {{ ref('finance_days') }}
GROUP BY date_date
ORDER BY date_date DESC