SELECT EXTRACT(MONTH FROM order_date) AS month,
       category AS p,
       SUM(sales) AS total_sales
FROM orders
GROUP BY EXTRACT(MONTH FROM order_date), p
ORDER BY MONTH;
