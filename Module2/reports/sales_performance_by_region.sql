SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    region AS sales_region
FROM
    orders
GROUP BY
    region;
