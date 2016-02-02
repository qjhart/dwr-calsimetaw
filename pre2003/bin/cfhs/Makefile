#! /usr/bin/make -f

INC:=/home/quinn/etosimetaw/bin
ifndef configure.mk
include ${INC}/configure.mk
endif

cfhs.mk:=1
v:=m m_0 b
season:=YR JFM AMJ JAS OND

rows:=$(shell seq -f %03g 0 299)

.PHONY:INFO
INFO::
	echo cfhs

.PHONY:db
db::${db}/cfhs ${db}/cfhs.seasonal_factors

${db}/cfhs:
	${PG} -f cfhs/schema.sql
	touch $@

seasonal_factors_calcs:=$(patsubst %,${db}/cfhs.seasonal_factors.%,${rows})
${db}/cfhs.seasonal_factors:${seasonal_factors_calcs}
	touch $@
${seasonal_factors_calcs}:${db}/cfhs.seasonal_factors.%:
	${PG} -c 'insert into cfhs.seasonal_factors select * from cfhs.seasonal_row_factor($*);'
	touch $@


cfhs.csv:${db}/cfhs.seasonal_factors
	${PG} -c 'truncate cfhs.cfhsAndNeighbors; insert into cfhs.cfhsAndNeighbors select * from cfhs.cfhs;'; \
	${PG} -c 'insert into cfhs.cfhsAndNeighbors select * from cfhs.cfhsMissingNeighborsAvg;'; \
	${PG} -c 'insert into cfhs.cfhsAndNeighbors select * from cfhs.cfhsMissingNeighborsAvg;'; \
	${PG} -c 'insert into cfhs.cfhsAndNeighbors select * from cfhs.cfhsMissingNeighborsAvg;'; \
	${PG-CSV} -c 'select * from cfhs.cfhsAndNeighbors order by y,x' > $@

PHONY:png
define png
png::cfhs.$1.$2.png
cfhs.$1.$2.png:%.png:
	export GRASS_WIDTH=1104; export GRASS_HEIGHT=1000;\
	export GRASS_TRUECOLOR=TRUE; \
	export GRASS_PNGFILE=$$@;\
	d.mon start=PNG; \
	g.region rast=$$*; \
	r.colors map=$$* rules=cfhs.$1.rules;\
	d.rast $$*; \
	d.legend map=$$* at=0,50,0,8 range=0.4,1.8 labelnum=8;\
	d.mon stop=PNG;
endef

$(foreach v,${v},$(foreach s,${season},$(eval $(call png,$v,$s))))