WITH ranked_products AS (
	SELECT region AS reg,
		   category AS cat,
		   product_name AS pn,
		   RANK() OVER(PARTITION BY category, region ORDER BY sales DESC) 
		   AS product_rank,
	       ROUND(AVG(sales) OVER(PARTITION BY category, region,product_name),2) AS avg_sales
	FROM orders
)

SELECT
  reg,
  cat,
  pn,
  avg_sales,
  sales,
  profit,
  profit_ratio
FROM
	(SELECT
	  reg,
	  cat,
	  pn,
	  product_rank,
	  avg_sales
	FROM
	  ranked_products
	WHERE
	  product_rank <= 5) AS rank_p

	JOIN (
		SELECT
			SUM(sales) as sales,
			SUM(profit) as profit,
			ROUND(SUM(profit)/SUM(sales)*100,2) AS profit_ratio,
			category,
			region,
			product_name
		FROM orders
		GROUP BY category,region,product_name
	) AS sales_profit
	ON rank_p.pn = sales_profit.product_name
	   AND rank_p.cat = sales_profit.category
	   AND rank_p.reg = sales_profit.region;