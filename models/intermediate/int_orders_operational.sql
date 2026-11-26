SELECT
  m.orders_id,
  m.date_date,
  CAST(
    m.marj
    + COALESCE(sh.shipping_fee, 0)
    - COALESCE(sh.ship_cost, 0)
    AS FLOAT64
  ) AS operasyonel_marj
FROM {{ ref('int_orders_margin') }} AS m
LEFT JOIN {{ ref('stg_raw_ship') }} AS sh
  ON m.orders_id = sh.orders_id