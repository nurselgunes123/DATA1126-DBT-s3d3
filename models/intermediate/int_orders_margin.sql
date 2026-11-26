SELECT
  s.order_id AS orders_id,
  MAX(s.date_date) AS date_date,
  SUM(CAST(s.revenue AS FLOAT64)) AS gelir,
  SUM(CAST(s.quantity AS FLOAT64)) AS miktar,
  SUM(CAST(s.satin_alma_maliyeti AS FLOAT64)) AS satin_alma_maliyeti,
  SUM(CAST(s.marj AS FLOAT64)) AS marj
FROM {{ ref('int_sales_margin') }} AS s
GROUP BY s.order_id