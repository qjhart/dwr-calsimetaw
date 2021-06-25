drop table if exists cimis_by_day;
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

create table cimis.year (
dwr_id varchar(8),
year integer,
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
primary key (dwr_id,year)
);

create or replace function cimis.add_to_year(year integer)
returns bigint as $$
insert into cimis.year(dwr_id,year,ymd,tn,tx,tdew,u2,eto,k,rnl,rs)
 select
 dwr_id,$1 as year,
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
where extract(year from ymd) = $1
group by dwr_id;
update cimis.year c
set pcp=d.pcp
from prism.year d
where c.year=d.year
and c.dwr_id=d.dwr_id
and c.year=$1;
-- return new data
select count(*) from cimis.year where year=$1;
$$ LANGUAGE SQL VOLATILE;

create or replace function cimis.add_year(year integer,fn text)
returns bigint as $$
drop table cimis_by_day;
select cimis.create_by_day($1,$2);
select cimis.add_to_year($1);
$$ LANGUAGE SQL;

create or replace function cimis.year_out_by_dwrid
(in_dwr_id varchar(8),in_year integer)
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
from cimis.year join
"4km".pixels p using (dwr_id)
where dwr_id=$1
and year=$2)
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

create or replace function cimis.out_year
  (base text, in_year integer)
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
    'select * from cimis.year_out_by_dwrid(''%1$s'',%2$s))'||
    ' to ''%3$s'' with csv header;',dwr_id,in_year,fn);
    RETURN NEXT fn; -- return current row of SELECT
END LOOP;
RETURN;
end
$$;

create or replace function cimis.et_year_out_by_dwrid
(in_dwr_id varchar(8),in_year integer)
RETURNS TABLE(
 X integer,Y integer,
 ymd date,eto decimal(6,2))
AS $$
with u as (
select p.x,p.y,
unnest(ymd) as ymd,
unnest(eto) as eto
from cimis.year join
"4km".pixels p using (dwr_id)
where dwr_id=$1
and year=$2)
select x,y,ymd,
eto::decimal(6,2)
from u;
$$ LANGUAGE SQL IMMUTABLE;

create or replace function cimis.et_out_year
  (base text, in_year integer)
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
    'select * from et_year_out_by_dwrid(''%1$s'',%2$s))'||
    ' to ''%3$s'' with csv header;',dwr_id,in_year,fn);
    RETURN NEXT fn; -- return current row of SELECT
END LOOP;
RETURN;
end
$$;
