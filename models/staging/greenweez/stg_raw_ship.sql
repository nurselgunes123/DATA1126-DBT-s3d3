SELECT
  * EXCEPT (shipping_fee_1, ship_cost),
  CAST(ship_cost AS INT64) AS ship_cost
FROM {{ source('greenweez', 'ship') }}