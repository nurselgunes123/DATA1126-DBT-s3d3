SELECT
    op.date_date,
    COUNT(DISTINCT op.orders_id) AS nb_transactions,
    ROUND(SUM(m.gelir), 2) AS turnover,
    ROUND(SUM(m.gelir) / NULLIF(COUNT(DISTINCT op.orders_id), 0), 2) AS average_basket,
    ROUND(SUM(op.operasyonel_marj), 2) AS operational_margin,
    ROUND(SUM(m.satin_alma_maliyeti), 2) AS purchase_cost,
    ROUND(SUM(sh.shipping_fee), 2) AS shipping_fee,
    ROUND(SUM(sh.ship_cost), 2) AS log_cost,
    SUM(m.miktar) AS quantity
FROM {{ ref("int_orders_operational") }} AS op
LEFT JOIN {{ ref("int_orders_margin") }} AS m
    ON op.orders_id = m.orders_id
LEFT JOIN {{ ref("stg_raw_ship") }} AS sh
    ON op.orders_id = sh.orders_id
GROUP BY op.date_date
ORDER BY op.date_date DESC