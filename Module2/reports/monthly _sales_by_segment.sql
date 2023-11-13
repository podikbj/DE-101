SELECT EXTRACT(MONTH FROM order_date) AS month,
       segment AS s,
       SUM(sales) AS total_sales
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date), s
ORDER BY MONTH;
