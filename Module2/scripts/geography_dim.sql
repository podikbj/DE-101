drop table  if exists data_model.geography_dim cascade;

CREATE TABLE data_model.geography_dim (
  geography_id serial NOT NULL,
  country VARCHAR(13) NOT NULL,
  city VARCHAR(17) NOT NULL,
  state VARCHAR(20) NOT NULL,
  postal_code VARCHAR(20),
  region VARCHAR(7) NOT NULL,
  person_id VARCHAR(4) NOT NULL,
  CONSTRAINT PK_geography_dim PRIMARY KEY ( geography_id )
);

CREATE INDEX idx_geodim_person_id 
ON data_model.geography_dim(person_id);

truncate data_model.geography_dim;

insert into data_model.geography_dim
select 100 + row_number() over(), country, city, state, postal_code, 
       region, person_id from (select distinct country, city, state, postal_code, 
                                  staging.orders.region, person_id from staging.orders left join data_model.persons_dim 
								  on staging.orders.region = data_model.persons_dim.region) g;
								  
select distinct country, city, state, postal_code from data_model.geography_dim
where country is null or city is null or postal_code is null;

update data_model.geography_dim
set postal_code = '05401'
where city = 'Burlington'  and postal_code is null;

update staging.orders
set postal_code = '05401'
where city = 'Burlington'  and postal_code is null;


select * from data_model.geography_dim
where city = 'Burlington'								  