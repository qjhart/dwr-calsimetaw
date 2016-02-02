\set ON_ERROR_STOP 1
BEGIN;
set search_path=summary,public;

truncate cimisM:r;

insert into cimisM:r ( x,y,year,month,days,
 tx1,tx2,tx_min,tx_max, 
 tn1,tn2,tn_min,tn_max,
 u21,u22,u2_min,u2_max,
 tdew1,tdew2,tdew_min,tdew_max,
 rs1,rs2,rs_min,rs_max,
 k1,k2,k_min,k_max,
 et01,et02,et0_min,et0_max,
 pcp1,pcp2,pcp_min,pcp_max,nrf)
select x,y,extract(year from ymd) as year,
           extract(month from ymd) as month,
           count(*) as days,
           sum(tx) as tx1, sum(tx^2) as tx2, 
           min(tx) as tx_min,max(tx) as tx_max,
           sum(tn) as tn1, sum(tn^2) as tn2,
           min(tn) as tn_min,max(tn) as tn_max,
           sum(u2) as u21, sum(u2^2) as u22,
           min(u2) as u2_min,max(u2) as u2_max,
           sum(tdew) as tdew1, sum(tdew^2) as tdew2,
           min(tdew) as tdew_min,max(tdew) as tdew_max,
           sum(rs) as rs1, sum(rs^2) as rs2,
           min(rs) as rs_min,max(rs) as rs_max,
           sum(k) as k1, sum(k^2) as k2,
           min(k) as k_min,max(k) as k_max,
           sum(et0) as et01, sum(et0^2) as et02,
           min(et0) as et0_min,max(et0) as et0_max,
           sum(pcp) as pcp1,sum(pcp^2) as pcp2,
	   min(pcp) as pcp_min,max(pcp) as pcp_max,
           sum(CASE WHEN pcp>et0 THEN 1 ELSE 0 END) as nrf 
from cimis4km.cimis:r 
group by x,y,extract(year from ymd),extract(month from ymd) 
order by x,y,year,month;

END;