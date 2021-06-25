create or replace function public.water_year(year integer)
returns date[] as $$
select
array_agg(d::date)
from generate_series(($1-1||'-10-01')::timestamp,
                     ($1||'-09-30')::timestamp,'1 day') as d(d);
$$ LANGUAGE SQL IMMUTABLE;
