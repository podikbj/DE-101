SELECT SUM(profit),
	segment
FROM orders
GROUP BY segment
ORDER BY SUM(profit);