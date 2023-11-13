SELECT city,
	subcategory,
	SUM(sales)
FROM orders
GROUP BY city,subcategory
ORDER BY city;