#! /usr/bin/make -f 

ifndef configure.mk
include configure.mk
endif

rows:=$(shell seq -f %03g 0 299)
rowtables:=$(patsubst %,${db}/previous.daily%,${rows})
rowtable-indices:=$(patsubst %,${db}/previous.daily%.idx,${rows})

.PHONY:db
db::db/previous ${rowtables}

db/previous:
	${PG} -f schema.sql
	touch $@

${rowtables}:db/previous.daily%:db/previous
	${PG} --variable=r=$* -f previous/add_previous.sql
	touch $@


${loc}/%/etc/db/previous: ${loc}/%/cellhd/Tn ${loc}/%/cellhd/Tx ${loc}/%/cellhd/PCP ${loc}/%/cellhd/ETo ${loc}/%/cellhd/RF
	[[ -d ${loc}/$*/etc/db ]] || mkdir -p ${loc}/$*/etc/db;\
	g.mapset $*
	${MASK};\
	doy=`date --date=$* +%j`;\
	declare -a M=(`echo $* | tr '-' ' '`);\
	r.stats -1 -n -x fs=, input=Tn,Tx,PCP,ETo,RF  |\
	sed -e "s/^/$*,$${M[0]},$${M[1]},$${M[2]},$$doy,/" |\
	${PG} -c "COPY previous.daily (ymd,year,month,day,doy,x,y,Tn,Tx,PCP,ETo,RF) from STDIN WITH CSV";
	${NOMASK};\
	touch $@

.PHONY: previous
previous: $(patsubst %,${loc}/%/etc/db/previous,${days})

#rows:=$(shell seq 0 265)
#$(foreach r,${rows},cols.$r:=$(shell row=`printf "%03d" $r`; ${PG} -t -c "select distinct x from previous.daily$${row} order by x"))

.PHONY: previous.daily
previous.daily: 
	[[ -d ${out}/joinkm ]] || mkdir -p ${out}/previous;\
	cd ${out}/previous;\
	for y in `seq 0 265`; do \
	 row=`printf "%03d" $$y`; \
	 echo $$row;\
	 for x in `${PG} -t -c "select distinct x from previous.daily$${row} order by x"`; do \
	  ${PG} -q -t -c "\COPY (select x,y,ymd,year,month,day,doy,tx,pcp as ppt from previous.daily$${row} where x=$${x} order by ymd) to daily_$${y}_$${x}.csv with csv header"; \
	 done ; \
	done

previous.daily.zip:
	cd ${out}/previous;\
	for z in `ls daily_*.csv | cut -d_ -f 1,2 | sed -e 's/.$$//' | sort -u`; do \
	 echo $${z}x; files=$${z}?_*.csv; zip -q $${z}x.zip $${files}; \
	done


