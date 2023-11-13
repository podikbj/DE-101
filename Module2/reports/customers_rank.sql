SELECT
  customer_name AS c,
  SUM(sales) AS s,

  CASE
    WHEN SUM(sales) < 100 THEN 'ranking 1'
    WHEN SUM(sales) >= 100 AND SUM(sales) < 500 THEN 'Ranking 2'
	WHEN SUM(sales) >= 500 AND SUM(sales) < 2000 THEN 'Ranking 3'
    ELSE 'Ranking 4'
  END AS customer_group
FROM
  orders
GROUP BY
  customer_name
ORDER BY
  customer_group ASC;
