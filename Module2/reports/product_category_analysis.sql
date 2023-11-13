SELECT category,
       SUM(profit) AS total_profit,
	   SUM(sales) AS total_sales
FROM orders
GROUP BY category
ORDER BY total_profit, total_sales