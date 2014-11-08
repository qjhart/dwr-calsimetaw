create schema join4km_station;
set search_path=join4km_station,public;

create temp table tmp_daily (
datestr varchar(8),
x integer,
y integer,
dwr_id varchar(8),
tmin float,
tmax float,
ppt float );

\COPY tmp_daily from station_pts_info.csv with csv NULL as '*'

create table daily (
ymd date,
dwr_id varchar(8),
tmin float,
tmax float,
ppt float,
primary key (ymd,dwr_id)
 );

insert into daily
select datestr::date,dwr_id,tmin,tmax,ppt from tmp_daily;

create table daily_regr as
with d as (
 select station_id,ymd as day,
 ppt from daily
 join ncdc.station_dwrid using (dwr_id)
)
select
 extract(year from day) as year,
 extract(month from day) as month,
 regr_count(d.ppt,w.v),
 regr_slope(d.ppt,w.v),
 regr_intercept(d.ppt,w.v),
 regr_r2(d.ppt,w.v)
from d
join ncdc.weather w
using (station_id,day)
where elem='PRCP'
and m not in ('M','S','(')
group by year,month ;
