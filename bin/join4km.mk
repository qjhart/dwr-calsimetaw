#! /usr/bin/make -f 

ifndef configure.mk
include configure.mk
endif

rows:=$(shell seq -f %03g 0 299)
rowtables:=$(patsubst %,${db}/join4km.daily%,${rows})
rowtable-indices:=$(patsubst %,${db}/join4km.daily%.idx,${rows})

.PHONY:db
db::${db}/join4km ${rowtables}

${db}/join4km:
	${PG} -f join4km/schema.sql
	touch $@

${rowtables}:${db}/join4km.daily%:${db}/join4km
	${PG} --variable=r=$* -f join4km/add_join4km.sql
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
	  ${PG} -q -t -c "\COPY (select x,y,ymd,year,month,day,doy,tx,pcp as ppt from join4km.daily$${row} where x=$${x} order by ymd) to daily_$${y}_$${x}.csv with csv header"; \
	 done ; \
	done

join4km.daily.zip:
	cd ${out}/join4km;\
	for z in `ls daily_* | cut -d_ -f 1,2 | sed -e 's/.$$//' | sort -u`; do \
	 echo $${z}x; files=$${z}?_*.csv; zip -q $${z}x.zip $${files}; \
	done
