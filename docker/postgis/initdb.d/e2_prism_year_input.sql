-- This is a replication of the input for standard years

create table prism.year (
dwr_id varchar(8),
year integer,
ymd date[],
tn float[],
tx float[],
pcp float[],
ETo float[],
rf boolean[],
primary key (dwr_id,year)
);

create or replace function prism.add_to_year(year integer)
returns bigint as $$
insert into prism.year(dwr_id,year,ymd,tn,tx,pcp,eto,rf)
 select
 dwr_id,$1 as year,
 array_agg(ymd order by ymd) as ymd,
 array_agg(tmin order by ymd) as tn,
 array_agg(tmax order by ymd) as tx,
 array_agg(ppt order by ymd) as pcp,
 array_agg(eto order by ymd) as eto,
array_agg(rf order by ymd) as rf
from prism_by_day
join "4km".pixels using (east,north)
where extract (year from ymd) = $1
group by dwr_id;
--select 1;
-- return new data
select count(*) from prism.year where year=$1;
$$ LANGUAGE SQL VOLATILE;

create or replace function prism.add_year(year integer,fn text)
returns bigint as $$
drop table prism_by_day;
select prism.create_by_day($1,$2);
select prism.add_to_year($1);
$$ LANGUAGE SQL;

create or replace function prism.year_out_by_dwrid
(in_dwr_id varchar(8),in_year integer)
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
from prism.year join
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
pcp::decimal(6,2) as ppt
from u;
$$ LANGUAGE SQL IMMUTABLE;

create or replace function prism.out_year
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
    EXECUTE format('copy ('||
      'select * from prism.year_out_by_dwrid(''%1$s'',%2$s))'||
      ' to ''%3$s'' with csv header;',
    dwr_id,in_year,fn);
    RETURN NEXT fn; -- return current row of SELECT
END LOOP;
RETURN;
end
$$;

--\set foo `for d in $(psql -c 'select dwr_id from "4km".pixels where dwr is true' -d etosimetaw -A -t --pset=footer);  do echo $d; psql -d etosimetaw -c "\COPY (select * from inp_prism.outPrismByDWR('$d','2010-10-01'::date,'2013-12-31'::date)) to prism_pixel/prism_$d.csv WITH CSV HEADER"; done`
