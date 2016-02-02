#! /usr/bin/make -f

ifndef configure.mk
include ../configure.mk
endif

rows:=$(shell seq -f %03g 0 299)

db:db/simetaw4km 

db/simetaw4km:
	${PG} -f schema.sql
	[[ -d db ]] || mkdir db
	touch $@

# In the LORE database (8.4) there is not ORDER BY inside the array_agg, so we need to verify these numbers are correct
db/simetaw4km.daily:db/%:db/simetaw4km
	for i in ${rows}; do \
	  echo $$i;\
	  ${PG} -c "insert into $* (x,y,tx,tn,pcp,eto,rf) select x,y,array_agg(tx),array_agg(tn),array_agg(pcp),array_agg(eto),array_agg(rf) from (select * from daily4km.daily$$i order by x,y,ymd) as f group by x,y"; \
	done
	touch $@

db/simetaw4km.dates:db/%:db/simetaw4km
	for i in ${rows}; do \
	  echo $$i;\
	  ${PG} -c "insert into $* (x,y,ymd) select x,y,array_agg(ymd) from (select * from daily4km.daily$$i order by x,y,ymd) as f group by x,y"; \
	done
	touch $@
