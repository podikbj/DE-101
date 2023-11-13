drop table if exists data_model.persons_dim  cascade;

create table data_model.persons_dim 
(
    person_id serial NOT NULL,
	person VARCHAR(17) NOT NULL,
	region VARCHAR(7) NOT NULL,
	CONSTRAINT PK_persons_dim PRIMARY KEY ( person_id)
);

truncate data_model.persons_dim;

insert into data_model.persons_dim 
select 100+row_number() over(), person, region from (select distinct person, region from staging.people) p;

select * from data_model.persons_dim per;
	
	
	