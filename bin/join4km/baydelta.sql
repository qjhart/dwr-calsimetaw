create schema baydelta;
set search_path=baydelta,public;
create table points ( 
id varchar(8) primary key,
region text,
centroid geometry('Point',3310)
);

insert into points 
VALUES 
('sac','Sacramento River',st_transform(st_setsrid(ST_MakePoint(-122.38,40.44),4326),3310)),
('sj','San Joaquin',st_transform(st_setsrid(ST_MakePoint(-121.02,37.62),4326),3310)),
('tul','Tulare Lake',st_transform(st_setsrid(ST_MakePoint(-119.34,35.1),4326),3310));

create view points_pixels as 
select id,dwr_id from points p join "4km".pixels x on (st_within(p.centroid,x.boundary));

create or replace view baydelta.point_station as 
with
l as ( 
 select station_id,water_year,centroid 
 from ncdc.station 
 join station_water_year_uptime u using (station_id)
 where u.count>250;
), 
m as (
 select id,station_id,water_year,
 st_distance(l.centroid,p.centroid) as dis 
 from baydelta.points p 
 join l on st_distance(l.centroid,p.centroid)<30000
), 
n as ( 
 select id,station_id,water_year,
 min(dis) OVER (partition by id,water_year) as min, 
 dis 
 from m
), 
o as ( 
 select id,station_id,water_year,dis::integer 
 from n where min=dis
) 
select id,station_id,
min(water_year) as min_year,
max(water_year) as max_year  
from o 
group by id,station_id 
order by id,min_year;
