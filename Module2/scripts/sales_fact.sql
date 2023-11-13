DROP TABLE IF EXISTS data_model.sales_fact

CREATE TABLE data_model.sales_fact
(
   sale_id serial NOT NULL,
   order_id VARCHAR(14) not null,
   sales NUMERIC(10,2) NOT NULL,
   profit NUMERIC(10,2)  NOT NULL,
   discount NUMERIC(10,2) NOT NULL,
   quantity INT NOT NULL,
   ord_id INT NOT NULL,
   prod_id INT NOT NULL,
   geography_id INT NOT NULL,
   cust_id INT NOT null,
   CONSTRAINT PK_sales_fact PRIMARY KEY ( sale_id )

);

truncate table data_model.sales_fact;

insert into data_model.sales_fact
select
  100+row_number() over() as sale_id,
  o.order_id as order_id,
  o.sales as sales,
  o.profit as profit,
  o.discount as discount,
  o.quantity as quantity,
  od.ord_id,
  prn.prod_id,
  gd.geography_id as geography_id,
  cd.cust_id as cust_id 
 
   
from staging.orders o
      inner join data_model.orders_dim od on o.order_id = od.order_id
      inner join data_model.products_dim prn on o.product_id = prn.product_id and o.product_name = prn.product_name 
            and o.category = prn.category and o.subcategory = prn.subcategory
      inner join data_model.geography_dim gd on o.country = gd.country 
           and o.city = gd.city and o.state = gd.state and o.region = gd.region 
           and o.postal_code = gd.postal_code::int
      inner join data_model.customers_dim cd on o.customer_id = cd.customer_id     
ORDER BY o.order_id;

select count(*) from data_model.sales_fact sf

CREATE INDEX idx_salesfct_customer_id 
ON data_model.sales_fact(cust_id);

CREATE INDEX idx_salesfct_sale_id
ON data_model.sales_fact(sale_id);

CREATE INDEX idx_salesfct_product_id 
ON data_model.sales_fact(prod_id);

CREATE INDEX idx_salesfct_order_id 
ON data_model.sales_fact(ord_id);

CREATE INDEX idx_salesfct_geography_id 
ON data_model.sales_fact(geography_id);