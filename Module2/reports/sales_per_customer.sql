SELECT customer_name AS c,      
       SUM(sales) AS s
FROM orders
GROUP BY c
ORDER BY c ASC