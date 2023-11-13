SELECT
    DATE(DATE_TRUNC('month', o.order_date)) AS order_month,
    COUNT(DISTINCT o.order_id) AS distinct_orders,
    COUNT(DISTINCT r.order_id) AS distinct_returned_orders,
    CASE
        WHEN COUNT(DISTINCT o.order_id) > 0 THEN ROUND(COUNT(DISTINCT r.order_id) * 1.0/ COUNT(DISTINCT o.order_id),2)
        ELSE NULL
    END AS return_ratio
FROM
    orders o
LEFT JOIN
    returns r ON o.order_id = r.order_id
GROUP BY
    DATE_TRUNC('month', o.order_date)
ORDER BY
    DATE_TRUNC('month', o.order_date);
