drop table if exist data_model.customers_dim cascade;

CREATE TABLE data_model.customers_dim (
  cust_id serial NOT NULL,
  customer_id VARCHAR(8) NOT NULL,
  customer_name VARCHAR(22) NOT NULL,
  segment VARCHAR(11) NOT NULL,
  CONSTRAINT PK_customers_dim PRIMARY KEY ( cust_id )
);

truncate table data_model.customers_dim;

insert into data_model.customers_dim
select 100+row_number() over(), customer_id, customer_name, segment from (select distinct customer_id, customer_name from staging.orders ) a;

	
select * from data_model.customer_dim cd;  