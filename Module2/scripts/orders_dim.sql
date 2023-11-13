drop table if exists data_model.orders_dim;

create table data_model.orders_dim 
(
	ord_id serial NOT NULL,
	order_id VARCHAR(14) NOT NULL,
	ship_mode VARCHAR(14) NOT NULL,
    returned VARCHAR(10),
    order_date INT NOT NULL,
    ship_date INT NOT NULL,
    CONSTRAINT PK_orders_dim PRIMARY KEY (ord_id)
);

truncate table data_model.orders_dim;

insert into data_model.orders_dim
select 
	100+row_number() over(), 
	order_id,
	ship_mode,
	COALESCE(returned, 'NO') AS returned,
	order_date,
	ship_date
	from (select distinct  
	             o.order_id as order_id,
	             o.ship_mode as ship_mode,
				 r.returned as returned,
				 ord_cal.date_id as order_date,
				 ship_cal.date_id as ship_date			 
				 
					from staging.orders o 
					left join staging.returns r on o.order_id = r.order_id
					left join data_model.calendar_dim ord_cal on o.order_date = ord_cal.date 
					left join data_model.calendar_dim ship_cal on o.ship_date = ship_cal.date 
					) as o;

select * from data_model.orders_dim; 					
					
					
	