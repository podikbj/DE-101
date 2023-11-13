WITH customer_churn AS (SELECT o.customer_id AS customer_id,	
	COUNT(DISTINCT o.order_id) AS total_orders,
	COUNT(DISTINCT r.order_id) AS total_returned,
	CASE
		WHEN COUNT(DISTINCT r.order_id) > 0 THEN 1
		ELSE 0
	END AS churned	
FROM orders o
LEFT JOIN returns r
ON o.order_id = r.order_id
GROUP BY customer_id)

SELECT churned,
	COUNT(DISTINCT customer_id) AS customer_count,
	COUNT(DISTINCT CASE WHEN churned = 0 THEN customer_id END) AS retain_customer,
	COUNT(DISTINCT CASE WHEN churned = 1 THEN customer_id END) AS churned_customer,
	ROUND(COUNT(DISTINCT CASE WHEN churned = 1 THEN customer_id END) * 1.0 / (
		SELECT COUNT(DISTINCT customer_id) AS customer_count FROM orders
	),2) AS churn_rate,
	ROUND(COUNT(DISTINCT CASE WHEN churned = 0 THEN customer_id END) * 1.0 / (
		SELECT COUNT(DISTINCT customer_id) AS customer_count FROM orders
	),2) AS retain_rate
	
FROM customer_churn
GROUP BY churned