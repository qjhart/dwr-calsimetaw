\set ON_ERROR_STOP 1
BEGIN;
drop schema if exists cfhs cascade;
create schema cfhs;
set search_path=cfhs,public;

END;

create table seasons (
season varchar(8),
month integer
);  

copy seasons from STDIN with CSV HEADER;
season,month
OND,10
OND,11
OND,12
JFM,1
JFM,2
JFM,3
AMJ,4
AMJ,5
AMJ,6
JAS,7
JAS,8
JAS,9
YR,10
YR,11
YR,12
YR,1
YR,2
YR,3
YR,4
YR,5
YR,6
YR,7
YR,8
YR,9
\.

create table seasonal_factors (
  x integer,
  y integer,
  season varchar(8),
  m float,
  b float,
  r2 float,
  m_0 float,
  r2_0 float,
  primary key(x,y,season)
);

create view cfhs as
select x,y,
yr.m_0::decimal(12,3) as YR,
ond.m_0::decimal(12,3) as OND,
jfm.m_0::decimal(12,3) as JFM,
AMJ.m_0::decimal(12,3) as AMJ,
jas.m_0::decimal(12,3) as JAS 
from seasonal_factors yr 
join seasonal_factors ond using (x,y) 
join seasonal_factors jfm using (x,y) 
join seasonal_factors amj using (x,y) 
join seasonal_factors jas using (x,y) 
where ond.season='OND' and jfm.season='JFM' 
and amj.season ='AMJ' and jas.season='JAS' 
and yr.season='YR';

create table cfhsAndNeighbors as select * from cfhs limit 0;

create view cfhsMissingNeighbors as 
select p.x,p.y,
w.yr as west,s.yr as south,e.yr as east,n.yr as north 
from daily4km.pixels p 
left join cfhsAndNeighbors c using (x,y) 
left join cfhsAndNeighbors w on (p.x-1=w.x and p.y=w.y) 
left join cfhsAndNeighbors s on (p.x=s.x and p.y+1=s.y) 
left join cfhsAndNeighbors e on (p.x+1=e.x and p.y=e.y) 
left join cfhsAndNeighbors n on (p.x=n.x and p.y-1=n.y) 
where c is null;

create or replace view cfhsMissingNeighborsAvg as 
select x,y,
(sumYr/count)::decimal(6,2) as yr,
(sumOND/count)::decimal(6,2) as ond,
(sumJFM/count)::decimal(6,2) as jfm,
(sumAMJ/count)::decimal(6,2) as amj,
(sumJAS/count)::decimal(6,2) as jas
from (
select p.x,p.y,
coalesce(w.yr,0)+coalesce(s.yr,0)+coalesce(e.yr,0)+coalesce(n.yr,0) 
as sumYr,
coalesce(w.ond,0)+coalesce(s.ond,0)+coalesce(e.ond,0)+coalesce(n.ond,0) 
as sumOnd,
coalesce(w.jfm,0)+coalesce(s.jfm,0)+coalesce(e.jfm,0)+coalesce(n.jfm,0) 
as sumJfm,
coalesce(w.amj,0)+coalesce(s.amj,0)+coalesce(e.amj,0)+coalesce(n.amj,0) 
as sumAmj,
coalesce(w.jas,0)+coalesce(s.jas,0)+coalesce(e.jas,0)+coalesce(n.jas,0) 
as sumJas,
(case when (w.yr is not null) THEN 1 else 0 END)+
(case when (s.yr is not null) THEN 1 else 0 END)+
(case when (e.yr is not null) THEN 1 else 0 END)+
(case when (n.yr is not null) THEN 1 else 0 END) as count 
from daily4km.pixels p 
left join cfhsAndNeighbors c using (x,y) 
left join cfhsAndNeighbors w on (p.x-1=w.x and p.y=w.y) 
left join cfhsAndNeighbors s on (p.x=s.x and p.y+1=s.y) 
left join cfhsAndNeighbors e on (p.x+1=e.x and p.y=e.y) 
left join cfhsAndNeighbors n on (p.x=n.x and p.y-1=n.y) 
where c is null ) as f where count >0;


CREATE OR REPLACE FUNCTION yearly_seasonal_row_factor(this_row integer) RETURNS SETOF factors AS $$
DECLARE
dt varchar(32);
ct varchar(32);
rows text;
BEGIN
dt := 'daily4km.daily' || lpad(this_row::text,3,'0');
ct := 'cimis4km.cimis' || lpad(this_row::text,3,'0');

drop table if exists tmp_last_row_factor; 
rows := 'create temp table tmp_last_row_factor as 
 select x,y,season,year,
 regr_slope(c.et0,d.eto) as m,
 regr_intercept(c.et0,d.eto) as b, 
 regr_r2(c.et0,d.eto), 
 sum(c.et0*d.eto)/sum(c.et0*c.et0) as m_0,
 (sum(c.et0*d.eto))^2/(sum(c.et0*c.et0)*sum(d.eto*d.eto)) as r2_0 
from ' || dt || ' d 
join ' || ct || ' c using (x,y,year,month,ymd) 
join cfhs.seasons using (month) 
group by season,year,x,y 
order by x,y,season;';

RAISE NOTICE '%', rows;

EXECUTE rows;

RETURN QUERY select * from tmp_last_row_factor;

drop table if exists tmp_last_row_factor;
END;

$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE FUNCTION seasonal_row_factor(this_row integer) 
RETURNS SETOF all_factors AS $$
DECLARE
dt varchar(32);
ct varchar(32);
rows text;
BEGIN
dt := 'daily4km.daily' || lpad(this_row::text,3,'0');
ct := 'cimis4km.cimis' || lpad(this_row::text,3,'0');

drop table if exists tmp_last_row_factor; 
rows := 'create temp table tmp_last_row_factor as 
 select x,y,season,
 regr_slope(c.et0,d.eto) as m,
 regr_intercept(c.et0,d.eto) as b, 
 regr_r2(c.et0,d.eto), 
 sum(c.et0*d.eto)/sum(d.eto*d.eto) as m_0,
 (sum(c.et0*d.eto))^2/(sum(c.et0*c.et0)*sum(d.eto*d.eto)) as r2_0 
from ' || dt || ' d 
join ' || ct || ' c using (x,y,year,month,ymd) 
join cfhs.seasons using (month) 
group by season,x,y 
order by x,y,season;';

--RAISE NOTICE '%', rows;

EXECUTE rows;

RETURN QUERY select * from tmp_last_row_factor;

drop table if exists tmp_last_row_factor;
END;
$$ LANGUAGE PLPGSQL;

