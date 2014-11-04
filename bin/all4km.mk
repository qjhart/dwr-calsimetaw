#! /usr/bin/make -f 
#1987=3652
#yr=1987; for d in `seq 0 3652`; do m=`date --date="${yr}-10-01 + $d days" --rfc-3339=date`; y=${m%%-*};  g.mapset -c location=$y mapset=$m; g.mremove -f vect=*; time ~/etosimetaw/bin/daily4km.mk 4km-all; done
#yr=1987; for d in `seq 0 3651`; do m=`date --date="${yr}-10-02 + $d days" --rfc-3339=date`; y=${m%%-*};  g.mapset location=$y mapset=$m; time ~/etosimetaw/bin/daily4km.mk 4km-all; done

INC:=/home/quinn/calsimetaw/bin
ifndef configure.mk
include ${INC}/configure.mk
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


ifdef is_daily

.PHONY: all4km
all4km: ${etc}/db/all4km

${etc}/db/all4km: ${rast}/jTn ${rast}/jTx ${rast}/jPCP ${rast}/jETo ${rast}/jRF
	[[ -d ${etc}/db ]] || mkdir -p ${etc}/db
	${MASK}
	date=`g.gisenv MAPSET`;\
	doy=`date --date=${date} +%j`;\
	declare -a M=(`g.gisenv MAPSET | tr '-' ' '`);\
	r.stats -1 -n -x fs=, input=jTn,jTx,jPCP,jETo,jRF 2>/dev/null |\
	sed -e "s/^/$$date,$${M[0]},$${M[1]},$${M[2]},$$doy,/" |\
	${PG} -c "COPY all4km.daily (ymd,year,month,day,doy,x,y,Tn,Tx,PCP,ETo,RF) from STDIN WITH CSV";
	${NOMASK}
	touch $@

endif

