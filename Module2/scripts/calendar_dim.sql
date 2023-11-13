drop table if exists data_model.calendar_dim;

create table data_model.calendar_dim 
(
    date_id serial NOT NULL,
	year INTEGER NOT NULL,
	quarter INTEGER NOT NULL,
	month INTEGER NOT NULL,
	week INTEGER NOT NULL,
	week_day VARCHAR(17) NOT NULL,
    date DATE NOT NULL, 
    leap BOOLEAN NOT NULL,
	CONSTRAINT PK_calendar_dim PRIMARY KEY (date_id)
);

truncate table data_model.calendar_dim;

insert into data_model.calendar_dim
select 
    to_char (date, 'yyyymmdd')::int as date_id,
    extract('year' from date)::int as year,
	extract('quarter' from date)::int as quarter,
	extract('month' from date)::int as month,
	extract('week' from date)::int as week,
	to_char(date, 'dy') as week_day,
	date,
    extract('day' from (date + interval '2 month - 1 day')) = 29 as leap
from generate_series(date '2000-01-01',
                       date '2030-01-01',
                       interval '1 day') as t(date);   
      
select * from data_model.calendar_dim;     