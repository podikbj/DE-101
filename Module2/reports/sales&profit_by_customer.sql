SELECT customer_name AS c,
       SUM(sales) AS s,
       SUM(profit) AS p
	   
FROM orders  
GROUP BY customer_name
ORDER BY c ASC
	   
	   