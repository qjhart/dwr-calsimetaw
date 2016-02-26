--set search_path=cimis,public;

create table cimis_wy (
dwr_id varchar(8),
water_year integer,
ymd date[],
tn float[],
tx float[],
tdew float[],
u2 float[],
ETo float[],
K float[],
Rnl float[],
Rs float[],
pcp float[],
primary key (dwr_id,water_year)
);

create or replace function cimis_create_by_day(year int,fn text)
RETURNS integer
LANGUAGE PLPGSQL VOLATILE AS $$
declare
--fn text;
count integer;
begin
--fn=format('%1$s/cimis_wy_%2$s.csv',base,year);
create temp table cimis_by_day (
ymd date,
east integer,
north integer,
tn float,
tx float,
tdew float,
u2 float,
ETo float,
K float,
Rnl float,
Rs float
);
EXECUTE format('copy cimis_by_day from ''%1$s'' with csv header;',fn);
create index cimis_by_day_east_north on cimis_by_day(east,north);
create index cimis_by_day_ymd on cimis_by_day(ymd);
return count;
end
$$;

create or replace function cimis_add_to_wy(year integer)
returns bigint as $$
insert into cimis_wy(dwr_id,water_year,ymd,tn,tx,tdew,u2,eto,k,rnl,rs)
 select
 dwr_id,$1 as water_year,
 array_agg(ymd order by ymd) as ymd,
 array_agg(tn order by ymd) as tn,
 array_agg(tx order by ymd) as tx,
 array_agg(tdew order by ymd) as tdew,
 array_agg(u2 order by ymd) as u2,
 array_agg(eto order by ymd) as eto,
 array_agg(k order by ymd) as k,
 array_agg(rnl order by ymd) as rnl,
 array_agg(rs order by ymd) as rs
from cimis_by_day
join "4km".pixels using (east,north)
where ymd = ANY(water_year($1))
group by dwr_id;
--select 1;
-- Now add PCP to our CIMIS estimates
update cimis_wy c
set pcp=d.pcp
from prism.prism_wy d
where c.water_year=d.water_year
and c.dwr_id=d.dwr_id
and c.water_year=$1;
-- return new data
select count(*) from cimis_wy where water_year=$1;
$$ LANGUAGE SQL VOLATILE;

create or replace function cimis_add_wy(year integer,fn text)
returns bigint as $$
drop table cimis_by_day;
select cimis_create_by_day($1,$2);
select cimis_add_to_wy($1);
$$ LANGUAGE SQL;

create or replace function cimis_out_by_dwrid
(in_dwr_id varchar(8),in_water_year integer)
RETURNS TABLE(
 X integer,Y integer,
 ymd date,year integer,month integer,day integer,doy integer,
 tx decimal(6,2),tn decimal(6,2),
 rs decimal(6,2),k decimal(6,2),
 u2 decimal(6,2),tdew decimal(6,2),
pcp decimal(6,2))
AS $$
with u as (
select p.x,p.y,
unnest(ymd) as ymd,
unnest(tx) as tx,
unnest(tn) as tn,
unnest(rs) as rs,
unnest(k) as k,
unnest(u2) as u2,
unnest(tdew) as tdew,
unnest(pcp) as pcp
from cimis.cimis_wy join
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
rs::decimal(6,2),
k::decimal(6,2),
u2::decimal(6,2),
tdew::decimal(6,2),
pcp::decimal(6,2)
from u;
$$ LANGUAGE SQL IMMUTABLE;

create or replace function cimis_out_wy
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
    EXECUTE format(
    'copy ('||
    'select * from cimis_out_by_dwrid(''%1$s'',%2$s))'||
    ' to ''%3$s'' with csv header;',dwr_id,in_water_year,fn);
    RETURN NEXT fn; -- return current row of SELECT
END LOOP;
RETURN;
end
$$;
