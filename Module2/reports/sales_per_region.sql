SELECT orders.region AS r,
       person AS p,
       SUM(sales) AS s
	  
FROM orders
LEFT JOIN people ON people.region = orders.region
GROUP BY r, p