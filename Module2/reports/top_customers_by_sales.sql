WITH top_customers AS (
    SELECT
        customer_name,
        region,
        category,
        SUM(sales) AS total_sales,
        RANK() OVER (PARTITION BY category, region ORDER BY SUM(sales) DESC) AS max_sales
    FROM
        orders
    GROUP BY
        customer_name, region, category
)

SELECT  region,
        category,
        customer_name,   
	  max_sales,
	   total_sales
FROM top_customers
WHERE max_sales = 1
ORDER BY region,customer_name , category;