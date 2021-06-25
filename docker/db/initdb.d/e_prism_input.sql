create schema prism;

create temp table prism_by_day (
ymd date,
east integer,
north integer,
tmin float,
tmax float,
ppt float,
ETo float,
RF boolean
);

create table prism.wy (
dwr_id varchar(8),
water_year integer,
ymd date[],
tn float[],
tx float[],
pcp float[],
ETo float[],
rf boolean[],
primary key (dwr_id,water_year)
);

create or replace function prism.create_by_day(year int,fn text)
RETURNS integer
LANGUAGE PLPGSQL VOLATILE AS $$
declare
--fn text;
count integer;
begin
--fn=format('%1$s/prism_wy_%2$s.csv',base,year);
--drop table if exists prism_by_day;
create temp table prism_by_day (
ymd date,
east integer,
north integer,
tmin float,
tmax float,
ppt float,
ETo float,
RF boolean
);
EXECUTE format('copy prism_by_day from ''%1$s'' with csv header;',fn);
create index by_day_east_north on prism_by_day(east,north);
create index by_day_ymd on prism_by_day(ymd);
return count;
end
$$;

create or replace function prism.add_to_wy(year integer)
returns bigint as $$
insert into prism.wy(dwr_id,water_year,ymd,tn,tx,pcp,eto,rf)
 select
 dwr_id,$1 as water_year,
 array_agg(ymd order by ymd) as ymd,
 array_agg(tmin order by ymd) as tn,
 array_agg(tmax order by ymd) as tx,
 array_agg(ppt order by ymd) as pcp,
 array_agg(eto order by ymd) as eto,
array_agg(rf order by ymd) as rf
from prism_by_day
join "4km".pixels using (east,north)
where ymd = ANY(water_year($1))
group by dwr_id;
--select 1;
-- return new data
select count(*) from prism.wy where water_year=$1;
$$ LANGUAGE SQL VOLATILE;

create or replace function prism.add_wy(year integer,fn text)
returns bigint as $$
drop table prism_by_day;
select prism.create_by_day($1,$2);
select prism.add_to_wy($1);
$$ LANGUAGE SQL;

--create or replace function prism.add_year(year integer,fn text)
--returns bigint as $$
--drop table prism_by_day;
--select prism.create_by_day($1,$2);
--select prism.add_to_year($1);
--$$ LANGUAGE SQL;

create or replace function prism.out_by_dwrid
(in_dwr_id varchar(8),in_water_year integer)
RETURNS TABLE(
 X integer,Y integer,
 ymd date,year integer,month integer,day integer,doy integer,
 tn decimal(6,2),
 tx decimal(6,2),
 pcp decimal(6,2))
AS $$
with u as (
select p.x,p.y,
unnest(ymd) as ymd,
unnest(tx) as tx,
unnest(tn) as tn,
unnest(pcp) as pcp
from prism.wy join
"4km".pixels p using (dwr_id)
where dwr_id=$1
and water_year=$2)
select x,y,ymd,
extract(year from ymd)::integer as year,
extract(month from ymd)::integer as month,
extract(day from ymd)::integer as day,
extract(doy from ymd)::integer as doy,
tx::decimal(6,2),
tn::decimal(6,2),
pcp::decimal(6,2) as ppt
from u;
$$ LANGUAGE SQL IMMUTABLE;

create or replace function prism.out_wy
  (base text, in_water_year integer)
RETURNS SETOF text
LANGUAGE PLPGSQL VOLATILE AS $$
declare
fn text;
dwr_id text;
begin
FOR dwr_id IN SELECT p.dwr_id FROM "4km".pixels p
LOOP
    fn=base||'/'||dwr_id||'.csv';
    EXECUTE format('copy ('||
      'select * from prism.out_by_dwrid(''%1$s'',%2$s))'||
      ' to ''%3$s'' with csv header;',
    dwr_id,in_water_year,fn);
    RETURN NEXT fn; -- return current row of SELECT
END LOOP;
RETURN;
end
$$;

--\set foo `for d in $(psql -c 'select dwr_id from "4km".pixels where dwr is true' -d etosimetaw -A -t --pset=footer);  do echo $d; psql -d etosimetaw -c "\COPY (select * from inp_prism.outPrismByDWR('$d','2010-10-01'::date,'2013-12-31'::date)) to prism_pixel/prism_$d.csv WITH CSV HEADER"; done`
