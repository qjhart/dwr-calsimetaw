drop schema if exists summary cascade;
create schema summary;

create view month_quad as
select x as month, 1+ (x-1)/3 as quad 
from generate_series(1,12) as x; 

create table eto_yearly_seasonal_sum (
  x integer,
  y integer,
  year integer,
  season varchar(8),
  days integer,
  cimis float,
  daily_season float,
  daily_single float
);


create or replace view eto_seasonal_sum as 
select x,y,season,
avg(cimis) as cimis,
avg(daily_season) as daily_season,
avg(daily_single) as daily_single
from eto_yearly_seasonal_sum
group by x,y,season;


CREATE OR REPLACE FUNCTION eto_yearly_seasonal_sum_row(this_row integer) 
RETURNS SETOF eto_yearly_seasonal_sum AS $$
DECLARE
dt varchar(32);
ct varchar(32);
rows text;
BEGIN
dt := 'summary.dailym' || lpad(this_row::text,3,'0');
ct := 'summary.cimism' || lpad(this_row::text,3,'0');

drop table if exists tmp_last_row_factor; 
rows:='create temp table tmp_last_row_factor as
select x,y,year,s.season,
 sum(c.days)::integer as days,
 sum(c.et01) as cimis,
 sum(d.eto1*s.m_0) as daily_season,
 sum(d.eto1*g.m_0) as daily_single
from '|| ct || ' c join ' || dt || ' d ' ||
'using (x,y,year,month) 
join cfhs.seasons using(month) 
join cfhs.seasonal_factors s using (x,y,season) 
join cfhs.seasonal_factors g using (x,y)
where g.season=''YR'' 
group by x,y,year,s.season';

RAISE NOTICE '%', rows;

EXECUTE rows;

RETURN QUERY select * from tmp_last_row_factor;

drop table if exists tmp_last_row_factor;
END;
$$ LANGUAGE PLPGSQL;

