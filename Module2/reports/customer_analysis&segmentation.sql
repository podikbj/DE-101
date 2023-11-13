SELECT 
customer_id,
customer_name,
COUNT(DISTINCT o.order_id) AS order_numbers,
SUM(o.sales) AS total_sales,
SUM(o.profit) AS total_profit,
SUM(o.quantity) AS total_quantity,
ROUND(AVG(o.quantity)) AS average_quantity_per_order,
COUNT(DISTINCT CASE WHEN o.sales > 0 THEN o.product_id END) AS distinct_products_purchased,
COUNT(DISTINCT CASE WHEN r.returned = 'Yes' THEN r.order_id END) AS total_returned_products,
MAX(o.sales) AS max_sales,
MIN(o.sales) AS min_sales,
MAX(o.profit) AS max_profit,
COUNT(DISTINCT r.order_id) AS total_returned_orders,
COUNT(DISTINCT o.segment) AS distinct_segments,
COUNT(DISTINCT o.category) AS distinct_category,
COUNT(DISTINCT o.city) AS distinct_city,
COUNT(DISTINCT o.state) AS distibct_state
FROM orders o
LEFT JOIN returns r
ON o.order_id = r.order_id
GROUP BY customer_name,customer_id