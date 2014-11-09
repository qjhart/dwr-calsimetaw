create view ncdc.station_dwrid as 
select station_id,dwr_id 
from ncdc.station s 
join "4km".pixels x on st_within(s.centroid,x.boundary);


create schema join4km_station;
set search_path=join4km_station,public;

create materialized view station_uptime as 
select 
station_id,
extract(year from day) as year,
extract(month from day) as month,
elem,count(*) 
from ncdc.weather 
where elem='PRCP'
group by station_id,year,month,elem;

create materialized view public.station_water_year_uptime as 
with w as (
select
station_id ,
CASE WHEN (month>=10) THEN year-1 ELSE year END as water_year,
month,count
from station_uptime)
select station_id,water_year,sum(count) as count 
from w 
group by station_id,water_year;

create materialized view join4km_station.daily as 
select dwr_id,x,y,ymd,tn,tx,pcp
from 
( select distinct dwr_id from ncdc.station_dwrid) as s 
join "4km".pixels using (dwr_id) 
join join4km.daily using (x,y);


create materialized view daily_regr as
with d as (
 select station_id,ymd as day,
 pcp as ppt from daily
 join ncdc.station_dwrid using (dwr_id)
)
select
 extract(year from day) as year,
 extract(month from day) as month,
 regr_count(d.ppt,w.v) as count,
 regr_slope(d.ppt,w.v) as slope,
 regr_intercept(d.ppt,w.v) as intercept,
 regr_r2(d.ppt,w.v) as r2
from d
join ncdc.weather w
using (station_id,day)
where elem='PRCP'
and m not in ('M','S','(')
group by year,month ;
