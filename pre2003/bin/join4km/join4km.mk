#! /usr/bin/make -f 

ifndef configure.mk
include ../configure.mk
endif

rows:=$(shell seq -f %03g 0 299)
rowtables:=$(patsubst %,db/join4km.daily%,${rows})
rowtable-indices:=$(patsubst %,db/join4km.daily%.idx,${rows})

.PHONY:db
db::db/join4km ${rowtables}

db/join4km:
	${PG} -f schema.sql
	touch $@

${rowtables}:db/join4km.daily%:db/join4km
	${PG} --variable=r=$* -f add_join4km.sql
	touch $@


${loc}/%/etc/db/join4km: ${loc}/%/cellhd/jTn ${loc}/%/cellhd/jTx ${loc}/%/cellhd/jPCP ${loc}/%/cellhd/jETo ${loc}/%/cellhd/jRF
	[[ -d ${loc}/$*/etc/db ]] || mkdir -p ${loc}/$*/etc/db;\
	g.mapset $*
	${MASK};\
	doy=`date --date=$* +%j`;\
	declare -a M=(`echo $* | tr '-' ' '`);\
	r.stats -1 -n -x fs=, input=jTn,jTx,jPCP,jETo,jRF  |\
	sed -e "s/^/$*,$${M[0]},$${M[1]},$${M[2]},$$doy,/" |\
	${PG} -c "COPY join4km.daily (ymd,year,month,day,doy,x,y,Tn,Tx,PCP,ETo,RF) from STDIN WITH CSV";
	${NOMASK};\
	touch $@

.PHONY: join4km
join4km: $(patsubst %,${loc}/%/etc/db/join4km,${days})

#rows:=$(shell seq 0 265)
#$(foreach r,${rows},cols.$r:=$(shell row=`printf "%03d" $r`; ${PG} -t -c "select distinct x from join4km.daily$${row} order by x"))

.PHONY: join4km.daily
join4km.daily: 
	[[ -d ${out}/joinkm ]] || mkdir -p ${out}/join4km;\
	cd ${out}/join4km;\
	for y in `seq 0 265`; do \
	 row=`printf "%03d" $$y`; \
	 echo $$row;\
	 for x in `${PG} -t -c "select distinct x from join4km.daily$${row} order by x"`; do \
	  ${PG} -q -t -c "\COPY (select x,y,ymd,year,month,day,doy,tx,tn,pcp as ppt from join4km.daily$${row} where x=$${x} order by ymd) to daily_$${y}_$${x}.csv with csv header"; \
	 done ; \
	done

join4km.simetaw: 
	[[ -d ${out}/joinkm ]] || mkdir -p ${out}/join4km;\
	cd ${out}/join4km;\
	for y in `seq 0 265`; do \
	 row=`printf "%03d" $$y`; \
	 echo $$row;\
	 for x in `${PG} -t -c "select distinct x from join4km.daily$${row} order by x"`; do \
	  ${PG} -q -t -c "\COPY (select extract(year from ymd) as year,extract(month from ymd) as month,extract(doy from ymd) as doy,lat::decimal(6,2),lon::decimal(6,2),Tx::decimal(6,2) as Tmax,Tn::decimal(6,2) as Tmin,pcp::decimal(6,2),eto::decimal(6,2)  from join4km.daily$${row} join \"4km\".pixels using (x,y) where x=$${x} order by ymd) to G$${y}_$${x}DPRISMETo_2.csv with csv header"; \
	 done ; \
	done

join4km.daily.zip:
	cd ${out}/join4km;\
	for z in `ls daily_*.csv | cut -d_ -f 1,2 | sed -e 's/.$$//' | sort -u`; do \
	 echo $${z}x; files=$${z}?_*.csv; zip -q $${z}x.zip $${files}; \
	done


.PHONY: stats
stats: sum_jPCP_frac.csv hist_jPCP_frac.csv avg_jPCP_frac.csv sum_jPCP_summed.csv hist_jPCP_summed.csv
sum_jPCP_frac.csv:
	cat $(patsubst %,${loc}/%/etc/sum/jPCP_frac.csv,${yms}) > $@

hist_jPCP_frac.csv:
	cat $(patsubst %,${loc}/%/etc/hist/jPCP_frac.csv,${yms}) > $@

avg_jPCP_frac.csv: sum_jPCP_frac.csv hist_jPCP_frac.csv
	${PG} -f monthly_stats.sql

sum_jPCP_summed.csv:
	cat $(patsubst %,${loc}/%/etc/sum/jPCP_summed.csv,${yms}) > $@

hist_jPCP_summed.csv:
	cat $(patsubst %,${loc}/%/etc/hist/jPCP_summed.csv,${yms}) > $@

