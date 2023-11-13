SELECT DATE(DATE_TRUNC('month', order_date)) AS ext_date,
       SUM(sales) AS total_sales,
	   COUNT(DISTINCT order_id) AS number_of_orders
FROM orders
GROUP BY ext_date
ORDER BY ext_date