{{ config(materialized='table') }}

SELECT
    DATE_TRUNC(date_date, MONTH) AS datemonth,
    ROUND(AVG(average_basket), 2) AS average_basket,
    ROUND(SUM(operational_margin), 2) AS operational_margin,
    SUM(quantity) AS quantity,
    ROUND(SUM(turnover), 2) AS turnover,
    ROUND(SUM(purchase_cost), 2) AS purchase_cost,
    ROUND(SUM(shipping_fee), 2) AS shipping_fee,
    ROUND(SUM(log_cost), 2) AS log_cost
FROM {{ ref('finance_campaigns_day') }}
GROUP BY datemonth
ORDER BY datemonth DESC