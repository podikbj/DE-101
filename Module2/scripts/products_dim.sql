drop table if exists data_model.products_dim cascade;

CREATE TABLE data_model.products_dim
 (
  prod_id   serial NOT NULL,
  product_id VARCHAR(15) NOT NULL,
  product_name VARCHAR(127) NOT NULL,
  category VARCHAR(15) NOT NULL,
  subcategory VARCHAR(11) NOT NULL,
  CONSTRAINT PK_products_dim PRIMARY KEY ( prod_id )
);

truncate data_model.products_dim;

insert into data_model.products_dim 
select 100+row_number() over(), product_id, product_name, category, subcategory from(select distinct product_id, product_name,
       category, subcategory from staging.orders) o;

select * from data_model.products_dim pr;	   