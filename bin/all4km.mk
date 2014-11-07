#! /usr/bin/make -f 

ifndef configure.mk
include configure.mk
endif

rows:=$(shell seq -f %03g 0 299)
rowtables:=$(patsubst %,${db}/all4km.daily%,${rows})
rowtable-indices:=$(patsubst %,${db}/all4km.daily%.idx,${rows})

.PHONY:db
db::${db}/all4km ${rowtables}

${db}/all4km:
	${PG} -f all4km/schema.sql
	touch $@

${rowtables}:${db}/all4km.daily%:${db}/all4km
	${PG} --variable=r=$* -f all4km/add_all4km.sql
	touch $@


${loc}/%/etc/db/all4km: ${loc}/%/cellhd/jTn ${loc}/%/cellhd/jTx ${loc}/%/cellhd/jPCP ${loc}/%/cellhd/jETo ${loc}/%/cellhd/jRF
	[[ -d ${loc}/$*/etc/db ]] || mkdir -p ${loc}/$*/etc/db;\
	g.mapset $*
	${MASK};\
	doy=`date --date=$* +%j`;\
	declare -a M=(`echo $* | tr '-' ' '`);\
	r.stats -1 -n -x fs=, input=jTn,jTx,jPCP,jETo,jRF  |\
	sed -e "s/^/$*,$${M[0]},$${M[1]},$${M[2]},$$doy,/" |\
	${PG} -c "COPY all4km.daily (ymd,year,month,day,doy,x,y,Tn,Tx,PCP,ETo,RF) from STDIN WITH CSV";
	${NOMASK};\
	touch $@

.PHONY: all4km
all4km: $(patsubst %,${loc}/%/etc/db/all4km,${days})


.PHONY: all4km.daily
all4km.daily: 
	[[ -d ${out}/allkm ]] || mkdir -p ${out}/all4km;\
	cd ${out}/all4km;\
	for y in `seq 0 265`; do \
	 row=`printf "%03d" $$y`; \
	 echo $$row;\
	 for x in `${PG} -t -c "select distinct x from all4km.daily$${row} order by x"`; do \
	  ${PG} -q -t -c "\COPY (select x,y,ymd,year,month,day,doy,tx,pcp as ppt from all4km.daily$${row} where x=$${x} order by ymd) to daily_$${y}_$${x}.csv with csv header"; \
	 done ; \
	done

