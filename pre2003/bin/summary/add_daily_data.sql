\set ON_ERROR_STOP 1
BEGIN;
set search_path=summary,public;

truncate dailyM:r;

insert into dailyM:r ( x,y,year,month,days,
 tx1,tx2,tx_min,tx_max, 
 tn1,tn2,tn_min,tn_max,
 eto1,eto2,eto_min,eto_max,
 pcp1,pcp2,pcp_min,pcp_max,nrf)
select x,y,extract(year from ymd) as year,
           extract(month from ymd) as month,
           count(*) as days,
           sum(tx) as tx1, sum(tx^2) as tx2, 
           min(tx) as tx_min,max(tx) as tx_max,
           sum(tn) as tn1, sum(tn^2) as tn2,
           min(tn) as tn_min,max(tn) as tn_max,
           sum(eto) as eto1,sum(eto^2) as eto2,
	   min(eto) as eto_min,max(eto) as eto_max,
           sum(pcp) as pcp1,sum(pcp^2) as pcp2,
	   min(pcp) as pcp_min,max(pcp) as pcp_max,
           sum(CASE WHEN rf is TRUE THEN 1 ELSE 0 END) as nrf 
from daily4km.daily:r 
group by x,y,extract(year from ymd),extract(month from ymd) 
order by x,y,year,month;

END;