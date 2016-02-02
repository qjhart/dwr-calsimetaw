set search_path=public;

create or replace function pointToXY(geometry) 
returns table(east float,north float,x int,y int) 
as $$
select x(p) as east,y(p) as north, 
((x(p) +402000) / 4000)::integer as x,
((y(p) - 456000) / -4000)::integer as y 
from transform(centroid($1),3310) as p; 
$$ LANGUAGE SQL;

create or replace function longitudeLatitudeToXY(long float,lat float) 
returns table(east float,north float,x int,y int) 
as $$
select * from pointToXY(SetSRID(MakePoint($1,$2),4326));
$$ LANGUAGE SQL;

create or replace function dailyFromLongitudeLatitude(long float,lat float)
returns setof daily4km.daily
as $$
BEGIN;

$$ LANGUAGE PLPGSQL;
