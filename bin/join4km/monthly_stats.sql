create table join4km.monthly_stats (
elem varchar(24),
ym char(7),
count integer,
sum float,
sum2 float);

truncate join4km.monthly_stats;

create or replace view join4km.monthly_avg as
select elem,ym,count,
(sum/count)::decimal(7,3) as avg,
sqrt(sum2/count-sum/count*sum/count)::decimal(14,3) as stdev 
from join4km.monthly_stats;

\copy join4km.monthly_stats from sum_jPCP_frac.csv with csv;

create table join4km.monthly_hist (
elem varchar(24),
ym char(7),
value float,
count integer);

truncate join4km.monthly_hist;

\copy join4km.monthly_hist from hist_jPCP_frac.csv with csv;

\copy (select * from join4km.monthly_avg) to avg_jPCP_frac.csv with csv;
